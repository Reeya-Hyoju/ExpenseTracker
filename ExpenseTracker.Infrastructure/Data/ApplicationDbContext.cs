using ExpenseTracker.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

namespace ExpenseTracker.Infrastructure.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }
        public DbSet<Transaction> Transaction { get; set; }
        public DbSet<ExpenseTracker.Domain.Entities.User> User { get; set; }
        public DbSet<ExpenseTracker.Domain.Entities.Tags> Tag { get; set; }
        /*
                protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
                {
                    string dbPath = Path.Combine("C:", "Users", "Dell", "Desktop", "ExpenseTracker", "ExpenseTracker","ExpenseTracker.Infrastructure","ExpenseTracker.db");

                    optionsBuilder.UseSqlite($"Data Source={dbPath}");
                }*/
    }
}
