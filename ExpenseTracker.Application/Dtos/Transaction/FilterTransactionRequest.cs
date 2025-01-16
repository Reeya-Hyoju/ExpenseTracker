using ExpenseTracker.Domain.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExpenseTracker.Application.Dtos.Transaction
{
    public class FilterTransactionRequest
    {
        public string? SearchQuery { get; set; }
        public TransactionType? Type { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public Guid? TagId { get; set; }
    }
}