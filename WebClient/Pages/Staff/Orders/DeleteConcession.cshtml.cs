using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace WebClient.Pages.Staff.Orders
{
    public class DeleteConcessionModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public DeleteConcessionModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<IActionResult> OnGetAsync(int id)
        {
            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/OrderConcessions/DeactivateOrderConcession/{id}", new { });

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while deactivating the OrderConcession.");
                return Page();
            }
        }
    }
}
