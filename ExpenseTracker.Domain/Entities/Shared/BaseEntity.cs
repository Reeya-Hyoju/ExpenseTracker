using System.ComponentModel.DataAnnotations;

namespace ExpenseTracker.Domain.Entities.Shared
{
    public class BaseEntity
    {
        [Key]
        public Guid Id { get; set; }
    }
}
