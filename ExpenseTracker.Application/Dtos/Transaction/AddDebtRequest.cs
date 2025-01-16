using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExpenseTracker.Application.Dtos.Transaction
{
    public class AddDebtRequest
    {
        public string Source { get; set; }
        public decimal Amount { get; set; }
        public DateTime DueDate { get; set; }
    }
}
