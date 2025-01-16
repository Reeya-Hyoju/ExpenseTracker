using ExpenseTracker.Application.Dtos.Tag;
using ExpenseTracker.Application.Dtos.Transaction;
using ExpenseTracker.Application.Interfaces;
using ExpenseTracker.Application.Services.Tags;
using ExpenseTracker.Domain.Enums;
using System.Collections.Generic;

namespace ExpenseTracker.Application.Services.Transaction
{
    public class TransactionService : ITransactionService
    {
        private readonly IGenericRepository<Domain.Entities.Transaction> _transactionRepository;
        private readonly IGenericRepository<Domain.Entities.User> _userRepository;
        private readonly ITagService _tagService;
        public TransactionService(IGenericRepository<Domain.Entities.Transaction> transactionRepository, IGenericRepository<Domain.Entities.User> userRepository, ITagService tagService)
        {
            _transactionRepository = transactionRepository;
            _userRepository = userRepository;
            _tagService = tagService;
        }
        public async Task<IEnumerable<GetTransactionResponse>> GetAllTransactionsAsync()
        {
            var user = _userRepository.Table.FirstOrDefault();
            if (user == null)
            {
                throw new Exception("User not found");
            }

            var tags = await _tagService.GetAllTagsAsync();

            var transactions = _transactionRepository.TableNoTracking
                .Select(transaction => new GetTransactionResponse
                {
                    Id = transaction.Id,
                    Title = transaction.Type == TransactionType.Debt
                ? transaction.Source
                : transaction.Title,
                    Amount = transaction.Amount,
                    Type = transaction.Type,
                    Notes = transaction.Notes,
                    Date = transaction.Date,
                    TagId = transaction.TagsId.GetValueOrDefault()
                });

            return transactions.ToList();
        }

        public async Task AddTransactionAsync(CreateTransactionRequest request)
        {
            var user = _userRepository.Table.FirstOrDefault();
            var transaction = new Domain.Entities.Transaction
            {
                Title = request.Title,
                Amount = request.Amount,
                Type = request.Type,
                Date = request.Date,
                Notes = request.Notes,
            };
            if (request.TagsId == null && string.IsNullOrEmpty(request.Tags))
            {
                throw new Exception("Transaction should be assigned to an existing Tag or a new Tag!");
            }
            else if (string.IsNullOrEmpty(request.Tags))
            {
                transaction.TagsId = request.TagsId;
            }
            else if (request.TagsId == null && !string.IsNullOrEmpty(request.Tags))
            {
                var tag = new CreateTagRequest
                {
                    Name = request.Tags
                };
                var newTag = await _tagService.CreateTagsAsync(tag);
                transaction.TagsId = newTag.Id;
            }
            else
            {
                throw new Exception("Transaction should be assigned to an existing Tag or a new Tag!");
            }

            await _transactionRepository.AddAsync(transaction);

            // updating user balance
            if (request.Type == TransactionType.Expense)
            {
                //handle exception
                if (user.TotalBalance < request.Amount)
                {
                    throw new Exception("Insufficient balance");
                }
                user.TotalBalance = user.TotalBalance - request.Amount;
            }
            else if (request.Type == TransactionType.Income)
            {
                user.TotalBalance = user.TotalBalance + request.Amount;
            }
            try
            {
                await _transactionRepository.SaveChangesAsync();
                await _userRepository.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        public async Task<IEnumerable<GetTransactionResponse>> FilterTransactionAsync(FilterTransactionRequest request)
        {
            var query = _transactionRepository.TableNoTracking.AsQueryable();


            // search query
            if (!string.IsNullOrEmpty(request.SearchQuery))
            {
                query = query.Where(t => t.Title.Contains(request.SearchQuery) || t.Notes.Contains(request.SearchQuery));
            }

            if (request.Type.HasValue)
            {
                query = query.Where(t => t.Type == request.Type.Value);
            }

            if (request.StartDate.HasValue)
            {
                query = query.Where(t => t.Date >= request.StartDate.Value);
            }

            if (request.EndDate.HasValue)
            {
                query = query.Where(t => t.Date <= request.EndDate.Value);
            }

            if (request.TagId.HasValue)
            {
                query = query.Where(t => t.TagsId == request.TagId.Value);
            }

            var transactions = query
                .Select(transaction => new GetTransactionResponse
                {
                    Id = transaction.Id,
                    Title = transaction.Title,
                    Amount = transaction.Amount,
                    Type = transaction.Type,
                    Notes = transaction.Notes,
                    Date = transaction.Date,
                    TagId = transaction.TagsId.GetValueOrDefault(),
                    TagsName = transaction.Tags.Name
                }).ToList();

            return transactions;
        }
        public int CountTransaction()
        {
            return _transactionRepository.TableNoTracking.Count();
        }
        public async Task AddDebtAsync(AddDebtRequest request)
        {
            var user = _userRepository.Table.FirstOrDefault();
            var transaction = new Domain.Entities.Transaction
            {
                Title = string.Empty,
                Notes = string.Empty,
                Source = request.Source,
                Amount = request.Amount,
                Type = TransactionType.Debt,
                Date = DateTime.Now,
                DueDate = request.DueDate,
                IsClearedDebt = false
            };
            await _transactionRepository.AddAsync(transaction);
            user.TotalBalance = user.TotalBalance + request.Amount;

            try
            {
                await _transactionRepository.SaveChangesAsync();
                await _userRepository.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public async Task ClearDebtAsync(Guid id)
        {
            var user = _userRepository.Table.FirstOrDefault();

            if (user == null)
            {
                throw new Exception("User not found");
            }

            var transaction = _transactionRepository.Table
                .FirstOrDefault(t => t.Id == id);

            if (transaction == null)
            {
                throw new Exception("Transaction not found");
            }

            if (transaction.Type != TransactionType.Debt)
            {
                throw new Exception("Transaction is not a debt");
            }

            if (transaction.IsClearedDebt == true)
            {
                throw new Exception("Debt already cleared");
            }

            transaction.IsClearedDebt = true;
            transaction.DebtClearedDate = DateTime.Now;

            transaction.Source = $"Cleared Debt on {transaction.DebtClearedDate.Value.ToShortDateString()}";

            user.TotalBalance -= transaction.Amount;

            try
            {
                await _transactionRepository.SaveChangesAsync();
                await _userRepository.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                throw new Exception($"Error occurred while clearing debt: {ex.Message}");
            }
        }
        public async Task<IEnumerable<GetAllPendingDebts>> GetAllPendingDebts()
        {
            var user = await _userRepository.FirstOrDefaultAsync();
            if (user == null)
            {
                throw new Exception("User not found");
            }

            var pendingDebts = _transactionRepository.TableNoTracking
                .Where(t => t.Type == TransactionType.Debt && t.IsClearedDebt == false)
                .Select(t => new GetAllPendingDebts
                {
                    Id = t.Id,
                    Source = t.Source,
                    Amount = t.Amount,
                    DueDate = t.DueDate,
                    DebtClearedDate = t.DebtClearedDate,
                    IsClearedDebt = t.IsClearedDebt
                });

            return pendingDebts.ToList();

        }
        public async Task<DebtOverview> GetDebtOverview()
        {
            var user = await _userRepository.FirstOrDefaultAsync();
            if (user == null)
            {
                throw new Exception("User not found");
            }

            //  total inflows
            var totalInflows = _transactionRepository.Table
                .Where(t => t.Type == TransactionType.Income)
                .Sum(t => (double)t.Amount);  // Cast to double

            //  total outflows (Expense and DebtCleared)
            var totalOutflows = _transactionRepository.Table
                .Where(t => t.Type == TransactionType.Expense || t.IsClearedDebt == true)
                .Sum(t => (double)t.Amount);  // Cast to double

            //  total debt (debts that are not cleared)
            var totalDebt = _transactionRepository.Table
                .Where(t => t.Type == TransactionType.Debt && t.IsClearedDebt == false)
                .Sum(t => (double)t.Amount);  // Cast to double

            //  total cleared debt
            var totalClearedDebt = _transactionRepository.Table
                .Where(t => t.Type == TransactionType.Debt && t.IsClearedDebt == true)
                .Sum(t => (double)t.Amount);  // Cast to double

            // remaining debt is total debt minus cleared debt
            var remainingDebt = totalDebt - totalClearedDebt;

            // Return the results as an object
            return new DebtOverview
            {
                TotalInflows = totalInflows,
                TotalOutflows = totalOutflows,
                TotalDebt = totalDebt,
                TotalClearedDebt = totalClearedDebt,
                RemainingDebt = remainingDebt
            };
        }

        public GetTransactionResponse? GetHighestInflow()
        {
            return _transactionRepository.TableNoTracking
                  .Where(t => t.Type == TransactionType.Income || t.Type == TransactionType.Debt)
                 .OrderByDescending(t => (double)t.Amount)
                  .Select(t => new GetTransactionResponse
                  {
                      // if title is empty, use source
                      Title = string.IsNullOrEmpty(t.Title) ? t.Source : t.Title,
                      Amount = t.Amount,
                      Type = t.Type,
                      Notes = t.Notes,
                      Date = t.Date,
                  })
                  .FirstOrDefault();
        }

        public GetTransactionResponse? GetHighestOutflow()
        {
            return _transactionRepository.TableNoTracking
                .Where(t => t.Type == TransactionType.Expense || t.IsClearedDebt == true)
                .OrderByDescending(t => (double)t.Amount)
                .Select(t => new GetTransactionResponse
                {
                    Title = string.IsNullOrEmpty(t.Title) ? t.Source : t.Title,
                    Amount = t.Amount,
                    Type = t.Type,
                    Notes = t.Notes,
                    Date = t.Date,
                })
                .FirstOrDefault();
        }

        public GetTransactionResponse? GetHighestDebt()
        {
            return _transactionRepository.TableNoTracking
                .Where(t => t.Type == TransactionType.Debt && t.IsClearedDebt == false)
               .OrderByDescending(t => (double)t.Amount)
                .Select(t => new GetTransactionResponse
                {
                    Title = string.IsNullOrEmpty(t.Title) ? t.Source : t.Title,
                    Amount = t.Amount,
                    Type = t.Type,
                    Notes = t.Notes,
                    Date = t.Date,
                })
                .FirstOrDefault();
        }
        public GetTransactionResponse? GetHighestInflow(DateTime fromDate, DateTime toDate)
        {
            return _transactionRepository.TableNoTracking
                .Where(t => (t.Type == TransactionType.Income || t.Type == TransactionType.Debt) && t.Date >= fromDate && t.Date <= toDate)
                .OrderByDescending(t => (double)t.Amount)
                .Select(t => new GetTransactionResponse
                {
                    Title = string.IsNullOrEmpty(t.Title) ? t.Source : t.Title,
                    Amount = t.Amount,
                    Type = t.Type,
                    Notes = t.Notes,
                    Date = t.Date,
                })
                .FirstOrDefault();
        }

        public GetTransactionResponse? GetHighestOutflow(DateTime fromDate, DateTime toDate)
        {
            return _transactionRepository.TableNoTracking
                .Where(t => (t.Type == TransactionType.Expense || t.IsClearedDebt == true) && t.Date >= fromDate && t.Date <= toDate)
                .OrderByDescending(t => (double)t.Amount)
                .Select(t => new GetTransactionResponse
                {
                    Title = string.IsNullOrEmpty(t.Title) ? t.Source : t.Title,
                    Amount = t.Amount,
                    Type = t.Type,
                    Notes = t.Notes,
                    Date = t.Date,
                })
                .FirstOrDefault();
        }

        public GetTransactionResponse? GetHighestDebt(DateTime fromDate, DateTime toDate)
        {
            return _transactionRepository.TableNoTracking
                .Where(t => (t.Type == TransactionType.Debt && t.IsClearedDebt == false) && t.Date >= fromDate && t.Date <= toDate)
                .OrderByDescending(t => (double)t.Amount)
                .Select(t => new GetTransactionResponse
                {
                    Title = string.IsNullOrEmpty(t.Title) ? t.Source : t.Title,
                    Amount = t.Amount,
                    Type = t.Type,
                    Notes = t.Notes,
                    Date = t.Date,
                })
                .FirstOrDefault();
        }

        public IEnumerable<GetTransactionResponse?> GetTopHighestTransactions()
        {
            return _transactionRepository.TableNoTracking.OrderByDescending
                (t => (double)t.Amount)
                .Select(t => new GetTransactionResponse
                {
                    Title = string.IsNullOrEmpty(t.Title) ? t.Source : t.Title,
                    Amount = t.Amount,
                    Type = t.Type,
                    Notes = t.Notes,
                    Date = t.Date,
                })
                .Take(5);
        }
        public IEnumerable<GetTransactionResponse?> GetTopHighestTransactions(DateTime fromDate, DateTime toDate)
        {
            return _transactionRepository.TableNoTracking
                .Where(t => t.Date >= fromDate && t.Date <= toDate)
                .OrderByDescending(t => (double)t.Amount)
                .Select(t => new GetTransactionResponse
                {
                    Title = string.IsNullOrEmpty(t.Title) ? t.Source : t.Title,
                    Amount = t.Amount,
                    Type = t.Type,
                    Notes = t.Notes,
                    Date = t.Date,
                })
                .Take(5);
        }
        public IEnumerable<GetTransactionResponse?> GetTopLowestTransactions()
        {
            return _transactionRepository.TableNoTracking
                .OrderBy(t => (double)t.Amount)
                .Select(t => new GetTransactionResponse
                {
                    Title = string.IsNullOrEmpty(t.Title) ? t.Source : t.Title,
                    Amount = t.Amount,
                    Type = t.Type,
                    Notes = t.Notes,
                    Date = t.Date,
                })
                .Take(5);
        }
        public IEnumerable<GetTransactionResponse?> GetTopLowestTransactions(DateTime fromDate, DateTime toDate)
        {
            return _transactionRepository.TableNoTracking
                .Where(t => t.Date >= fromDate && t.Date <= toDate)
                .OrderBy(t => (double)t.Amount)
                .Select(t => new GetTransactionResponse
                {
                    Title = string.IsNullOrEmpty(t.Title) ? t.Source : t.Title,
                    Amount = t.Amount,
                    Type = t.Type,
                    Notes = t.Notes,
                    Date = t.Date,
                })
                .Take(5);
        }

    }
}
