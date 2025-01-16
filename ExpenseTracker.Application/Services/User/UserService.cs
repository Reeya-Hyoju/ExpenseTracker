using ExpenseTracker.Application.Dtos.User;
using ExpenseTracker.Application.Interfaces;

namespace ExpenseTracker.Application.Services.User
{
    public class UserService : IUserService
    {
        private readonly IGenericRepository<Domain.Entities.User> _userRepository;
        public UserService(IGenericRepository<Domain.Entities.User> userRepository)
        {
            _userRepository = userRepository;
        }
        public async Task CreateUserAsync(CreateUserRequest request)
        {
            // first check if any user is in database or not
            var userCheck = await _userRepository.FirstOrDefaultAsync();
            if (userCheck != null)
            {
                throw new Exception("User already exists");
            }
            var newUser = new Domain.Entities.User
            {
                UserName = request.UserName,
                Password = request.Password,
                PreferredCurrency = request.PreferredCurrency,
                TotalBalance = 0
            };
            await _userRepository.AddAsync(newUser);
            await _userRepository.SaveChangesAsync();
        }
        public async Task<bool> AuthenticateUserAsync(LoginRequest request)
        {
            var user = await _userRepository.FirstOrDefaultAsync();
            if (user == null)
            {
                throw new Exception("User not found");
            }
            if (user.UserName == request.UserName && user.Password == request.Password)
            {
                return true;
            }
            return false;
        }
        public async Task<decimal> GetUserBalanceAsync()
        {
            var user = await _userRepository.FirstOrDefaultAsync();
            if (user == null)
            {
                throw new Exception("User not found");
            }
            return user.TotalBalance;
        }
        public bool IsUserExistsAsync()
        {
            return _userRepository.Table.Any();
        }
        public string GetUserCurrency()
        {
            var user = _userRepository.TableNoTracking.FirstOrDefault();
            if (user == null)
            {
                throw new Exception("User not found");
            }
            return user.PreferredCurrency;
        }
    }
}
