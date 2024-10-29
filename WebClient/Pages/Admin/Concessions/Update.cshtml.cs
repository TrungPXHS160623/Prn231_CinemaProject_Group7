using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Prn231_CinemaProject_Group7.Models;


namespace WebClient.Pages.Admin.Concessions
{
    public class UpdateModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public UpdateModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public Concession Concession { get; set; }

        [BindProperty]
        public bool IsActive { get; set; }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            var concession = await _httpClient.GetFromJsonAsync<Concession>($"http://localhost:5280/api/Concessions/GetConcession/{id}");
            if (concession == null)
            {
                return NotFound();
            }

            Concession = concession;
            IsActive = Concession.IsActive ?? false;

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            Concession.IsActive = IsActive;

            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Concessions/UpdateConcession/{Concession.ProductId}", Concession);

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