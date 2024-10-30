using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.News
{
    public class UpdateModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public UpdateModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public WebClient.Models.News New { get; set; }

        [BindProperty]
        public bool IsActive { get; set; }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            var concession = await _httpClient.GetFromJsonAsync<WebClient.Models.News>($"http://localhost:5280/api/Concessions/GetNew/{id}");
            if (concession == null)
            {
                return NotFound();
            }

            New = concession;
            IsActive = New.IsActive ?? false;

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            New.IsActive = IsActive;

            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/News/UpdateNew/{New.NewsId}", New);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while updating the concession.");
                return Page();
            }
        }
    }
}
