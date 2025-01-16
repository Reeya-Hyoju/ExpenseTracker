using ExpenseTracker.Application.Dtos.Transaction;

namespace ExpenseTracker.Application.Services.Transaction
{
    public interface ITransactionService
    {
        Task<IEnumerable<GetTransactionResponse>> GetAllTransactionsAsync();
        Task AddTransactionAsync(CreateTransactionRequest request);
        Task<IEnumerable<GetTransactionResponse>> FilterTransactionAsync(FilterTransactionRequest request);
        int CountTransaction();
        Task<IEnumerable<GetAllPendingDebts>> GetAllPendingDebts();
        Task AddDebtAsync(AddDebtRequest request);
        Task ClearDebtAsync(Guid id);
        Task<DebtOverview> GetDebtOverview();
        GetTransactionResponse? GetHighestInflow();
        GetTransactionResponse? GetHighestOutflow();
        GetTransactionResponse? GetHighestDebt();
        GetTransactionResponse? GetHighestInflow(DateTime fromDate, DateTime toDate);
        GetTransactionResponse? GetHighestOutflow(DateTime fromDate, DateTime toDate);
        GetTransactionResponse? GetHighestDebt(DateTime fromDate, DateTime toDate);
        IEnumerable<GetTransactionResponse?> GetTopHighestTransactions();
        IEnumerable<GetTransactionResponse?> GetTopHighestTransactions(DateTime fromDate, DateTime toDate);
        IEnumerable<GetTransactionResponse?> GetTopLowestTransactions();
        IEnumerable<GetTransactionResponse?> GetTopLowestTransactions(DateTime fromDate, DateTime toDate);
    }
}
