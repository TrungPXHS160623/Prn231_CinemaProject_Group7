using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Staff.Orders
{
    public class UpdateConcessionModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public UpdateConcessionModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public OrderConcession OrderConcession { get; set; }
        public IList<Concession> Concessions { get; set; }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            var concession = await _httpClient.GetFromJsonAsync<OrderConcession>($"http://localhost:5280/api/OrderConcessions/GetOrderConcession/{id}");
            if (concession == null)
            {
                return NotFound();
            }
            OrderConcession = concession;
            Concessions = await _httpClient.GetFromJsonAsync<IList<Concession>>("http://localhost:5280/api/Concessions/GetAllConcessions");
            Concessions = Concessions.Where(c => c.IsActive == true).ToList();
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            var couponResponse = _httpClient.GetFromJsonAsync<Concession>($"http://localhost:5280/api/Concessions/GetConcession/{OrderConcession.ConcessionId}").Result;
            if (couponResponse != null)
            {
                OrderConcession.Price = couponResponse.Price * OrderConcession.Quantity;
            }
            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/OrderConcessions/UpdateOrderConcession/{OrderConcession.OrderConcessionId}", OrderConcession);

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