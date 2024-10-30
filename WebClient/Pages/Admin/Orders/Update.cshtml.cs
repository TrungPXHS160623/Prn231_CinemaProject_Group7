using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.Orders
{
    public class UpdateModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public UpdateModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public Order Order { get; set; }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            var concession = await _httpClient.GetFromJsonAsync<Order>($"http://localhost:5280/api/Orders/GetOrder/{id}");
            if (concession == null)
            {
                return NotFound();
            }

            Order = concession;

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Orders/UpdateOrder/{Order.OrderId}", Order);

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
