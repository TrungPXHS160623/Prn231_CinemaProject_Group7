using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace WebClient.Pages.Admin.Orders
{
    public class DeleteModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public DeleteModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<IActionResult> OnGetAsync(int id)
        {
            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Orders/DeactivateOrder/{id}", new { });

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while deactivating the concession.");
                return Page();
            }
        }
    }
}
