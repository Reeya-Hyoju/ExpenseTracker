using ExpenseTracker.Application.Dtos.User;
using ExpenseTracker.Application.Services.User;
using ExpenseTracker.Infrastructure.Data;

namespace ExpenseTracker_UI.Components.Pages.Login
{
    public partial class LoginPage : ContentPage
    {
        private readonly IUserService _userService;
 

        public LoginPage(IUserService userService)
        {
            InitializeComponent();
            _userService = userService;
        }

        private async void OnLoginClicked(object sender, EventArgs e)
        {
            var username = UsernameEntry.Text;
            var password = PasswordEntry.Text;

            var request = new LoginRequest
            {
                UserName = username,
                Password = password
            };

            var isValidUser = await _userService.AuthenticateUserAsync(request);

            if (isValidUser)
            {
                // Navigate to the MainPage after successful login
                await Navigation.PushAsync(new MainPage());
            }
            else
            {
                await DisplayAlert("Login Failed", "Invalid username or password.", "OK");
            }
        }
    }
}
