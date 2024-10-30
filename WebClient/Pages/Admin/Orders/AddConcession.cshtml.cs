using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.Orders
{
    public class AddConcessionModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public AddConcessionModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public OrderConcession OrderConcession { get; set; }

        public void OnGet(int id)
        {
            OrderConcession = new OrderConcession
            {
                OrderId = id
            };
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/OrderConcessions/CreateOrderConcession", OrderConcession);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while adding the concession.");
                return Page();
            }
        }
    }
}
