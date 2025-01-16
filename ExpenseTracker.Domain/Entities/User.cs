using ExpenseTracker.Domain.Entities.Shared;
using System.ComponentModel.DataAnnotations;

namespace ExpenseTracker.Domain.Entities
{
    public class User : BaseEntity
    {
        [Required]
        public string UserName { get; set; }
        [Required]
        public string Password { get; set; }
        [Required(ErrorMessage = "Preferred currency is required.")]

        [RegularExpression(@"^[A-Z]{3}$", ErrorMessage = "Preferred currency must be a 3-letter ISO 4217 currency code (e.g., USD).")]
        public string PreferredCurrency { get; set; }
        public decimal TotalBalance { get; set; }
        public ICollection<Transaction> Transactions { get; set; }
    }
}
