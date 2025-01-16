using ExpenseTracker.Domain.Enums;

namespace ExpenseTracker.Application.Dtos.Transaction
{
    public class CreateTransactionRequest
    {
        public string Title { get; set; }
        public decimal Amount { get; set; }
        public TransactionType Type { get; set; }
        public string Notes { get; set; }
        public Guid? TagsId { get; set; }
        public string? Tags { get; set; }
        public DateTime Date { get; set; }
    }
}
