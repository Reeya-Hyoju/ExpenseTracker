using ExpenseTracker.Domain.Entities.Shared;

namespace ExpenseTracker.Domain.Entities
{
    public class Tags : BaseEntity
    {
        public string Name { get; set; }
        public ICollection<Transaction> Transactions { get; set; }
    }
}
