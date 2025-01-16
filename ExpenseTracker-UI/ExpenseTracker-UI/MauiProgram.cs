using ExpenseTracker.Application.Interfaces;
using ExpenseTracker.Application.Services.Tags;
using ExpenseTracker.Application.Services.Transaction;
using ExpenseTracker.Application.Services.User;
using ExpenseTracker.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace ExpenseTracker_UI
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });

            builder.Services.AddMauiBlazorWebView();
            builder.Services.AddSingleton<ITransactionService, TransactionService>();
            builder.Services.AddSingleton<ITagService, TagService>();
            builder.Services.AddSingleton<IUserService, UserService>();
            builder.Services.AddSingleton(typeof(IGenericRepository<>), typeof(GenericRepository<>));
            builder.Services.AddDbContext<ApplicationDbContext>(options =>
            {
                // Using absolute path to the SQLite database
                string dbPath = Path.Combine("C:", "Users", "Dell", "Desktop", "ExpenseTracker", "ExpenseTracker", "ExpenseTracker.Infrastructure", "ExpenseTracker.db");
                options.UseSqlite($"Data Source={dbPath}");
            });



#if DEBUG
            builder.Services.AddBlazorWebViewDeveloperTools();
            builder.Logging.AddDebug();
#endif
            var app = builder.Build();
            MauiProgram.ConfigureServices(app.Services);
            return app;
        }
        public static IServiceProvider Services { get; private set; }

        public static void ConfigureServices(IServiceProvider serviceProvider)
        {
            Services = serviceProvider;
        }
    }
}
