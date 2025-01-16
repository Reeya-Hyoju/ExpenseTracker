using ExpenseTracker.Domain.Entities.Shared;
using ExpenseTracker.Domain.Enums;
using System.ComponentModel.DataAnnotations.Schema;

namespace ExpenseTracker.Domain.Entities
{
    public class Transaction : BaseEntity
    {
        public string Title { get; set; }
        public decimal Amount { get; set; }
        public TransactionType Type { get; set; }
        public string Notes { get; set; }
        public Tags Tags { get; set; }
        public Guid? TagsId { get; set; }
        public DateTime Date { get; set; }
        public string? Source { get; set; }
        public bool? IsClearedDebt { get; set; }
        public DateTime? DueDate { get; set; }
        public DateTime? DebtClearedDate { get; set; }
    }
}
