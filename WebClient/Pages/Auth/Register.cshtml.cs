using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.DTO;
using System.Net.Http;
using System.Threading.Tasks;

namespace WebClient.Pages.Auth
{
    public class RegisterModel : PageModel
    {
        private readonly HttpClient _httpClient;

        [BindProperty]
        public RegisterRequestDto RegisterRequest { get; set; }

        public RegisterModel(HttpClient httpClient)
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

            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/Auth/Register", RegisterRequest);
            if (response.IsSuccessStatusCode)
            {
                TempData["Message"] = "Registration successful! Please log in.";
                return RedirectToPage("/Auth/Login");
            }

            TempData["ErrorMessage"] = "Registration failed. Please try again.";
            return Page();
        }
    }
}
