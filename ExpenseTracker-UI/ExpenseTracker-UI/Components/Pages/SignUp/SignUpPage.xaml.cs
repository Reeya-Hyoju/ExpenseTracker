using ExpenseTracker.Application.Dtos.User;
using ExpenseTracker.Application.Services.User;
using ExpenseTracker.Domain.Entities;
using ExpenseTracker_UI.Components.Pages.Login;

namespace ExpenseTracker_UI.Components.Pages.SignUp
{
    public partial class SignUpPage : ContentPage
    {
        private readonly IUserService _userService;

        public SignUpPage(IUserService userService)
        {
            InitializeComponent();
            _userService = userService;
        }

        private async void OnSignUpClicked(object sender, EventArgs e)
        {
            var username = UsernameEntry.Text;
            var password = PasswordEntry.Text;
            var preferredCurrency = CurrencyEntry.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(preferredCurrency))
            {
                await DisplayAlert("Validation", "Please fill all the fields.", "OK");
                return;
            }
            if (preferredCurrency.Length != 3 || !preferredCurrency.All(char.IsUpper))
            {
                await DisplayAlert("Validation", "Preferred Currency must be a 3-letter ISO code (e.g., USD).", "OK");
                return;
            }
            var request = new CreateUserRequest
            {
                UserName = username,
                Password = password,
                PreferredCurrency = preferredCurrency
            };

            await _userService.CreateUserAsync(request);

            // Navigate to the LoginPage after successful sign-up
            await Navigation.PushAsync(new LoginPage(_userService));
        }
    }
}
