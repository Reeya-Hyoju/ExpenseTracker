using ExpenseTracker.Application.Services.User;
using ExpenseTracker_UI.Components.Pages.Login;
using ExpenseTracker_UI.Components.Pages.SignUp;

namespace ExpenseTracker_UI
{
    public partial class App : Application
    {
        private readonly IUserService _userService;

        public App(IUserService userService)
        {
            InitializeComponent();
            _userService = userService;

            bool isUserExists = _userService.IsUserExistsAsync();
            if (!isUserExists)
            {
                MainPage = new NavigationPage(new SignUpPage(_userService));
            }
            else
            {
                MainPage = new NavigationPage(new LoginPage(_userService));
            }
        }
    }
}
