using ExpenseTracker.Domain.Enums;

namespace ExpenseTracker.Application.Dtos.Transaction
{
    public class GetTransactionResponse
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public decimal Amount { get; set; }
        public TransactionType Type { get; set; }
        public string Notes { get; set; }
        public string TagsName { get; set; }
        public Guid TagId { get; set; }
        public DateTime Date { get; set; }
    }
}
