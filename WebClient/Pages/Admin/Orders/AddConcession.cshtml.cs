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
        public IList<Concession> Concessions { get; set; }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            OrderConcession = new OrderConcession
            {
                OrderId = id
            };
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
