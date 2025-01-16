using ExpenseTracker.Infrastructure.Data;
using Microsoft.Extensions.DependencyInjection;

namespace ExpenseTracker_UI
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();

            // Accessing ApplicationDbContext from IServiceProvider
            var context = MauiProgram.Services.GetRequiredService<ApplicationDbContext>();

            SeedTags(context);
        }

        private void SeedTags(ApplicationDbContext context)
        {
            // Check if there are already tags in the database
            if (!context.Tag.Any())
            {
                var tags = new List<ExpenseTracker.Domain.Entities.Tags>
                {
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "Yearly" },
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "Monthly" },
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "Food" },
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "Drinks" },
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "Clothes" },
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "Gadgets" },
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "Miscellaneous" },
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "Fuel" },
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "Rent" },
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "EMI" },
                    new ExpenseTracker.Domain.Entities.Tags { Id = Guid.NewGuid(), Name = "Party" }
                };

                // Add tags to the context
                context.Tag.AddRange(tags);

                // Save changes to the database
                context.SaveChanges();
            }
        }
    }
}
