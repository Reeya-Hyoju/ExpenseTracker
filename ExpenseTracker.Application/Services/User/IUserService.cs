using ExpenseTracker.Application.Dtos.User;

namespace ExpenseTracker.Application.Services.User
{
    public interface IUserService
    {
        Task CreateUserAsync(CreateUserRequest request);
        Task<bool> AuthenticateUserAsync(LoginRequest request);
        bool IsUserExistsAsync();
        Task<decimal> GetUserBalanceAsync();
        string GetUserCurrency();

    }
}
