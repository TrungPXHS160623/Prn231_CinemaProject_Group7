using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.DTO;
using System.Net.Http;
using System.Threading.Tasks;

namespace WebClient.Pages.Auth
{
    public class LoginModel : PageModel
    {
        private readonly HttpClient _httpClient;

        [BindProperty]
        public LoginRequestDto LoginRequest { get; set; }

        public LoginModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/Auth/Login", LoginRequest);
            if (response.IsSuccessStatusCode)
            {
                var loginResponse = await response.Content.ReadFromJsonAsync<LoginResponseDto>();
                TempData["JwtToken"] = loginResponse.JwtToken; // Store JWT Token
                return RedirectToPage("/Index"); // Redirect to the home page or wherever you want after successful login
            }

            TempData["ErrorMessage"] = "Login failed. Please check your username or password.";
            return Page();
        }
    }
}
