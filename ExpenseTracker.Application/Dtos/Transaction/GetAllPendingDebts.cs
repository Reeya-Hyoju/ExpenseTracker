namespace ExpenseTracker.Application.Dtos.Transaction
{
    public class GetAllPendingDebts
    {
        public Guid Id { get; set; }
        public string Source { get; set; }
        public bool? IsClearedDebt { get; set; }
        public decimal Amount { get; set; }
        public DateTime? DueDate { get; set; }
        public DateTime? DebtClearedDate { get; set; }
    }
}
