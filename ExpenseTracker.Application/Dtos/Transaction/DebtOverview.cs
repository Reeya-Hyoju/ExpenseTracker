using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExpenseTracker.Application.Dtos.Transaction
{
    public class DebtOverview
    {
        public double TotalInflows { get; set; }
        public double TotalOutflows { get; set; }
        public double TotalDebt { get; set; }
        public double TotalClearedDebt { get; set; }
        public double RemainingDebt { get; set; }
    }
}
