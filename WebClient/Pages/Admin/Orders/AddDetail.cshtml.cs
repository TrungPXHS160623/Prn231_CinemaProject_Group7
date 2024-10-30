using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.Orders
{
    public class AddDetailModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public AddDetailModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public OrderDetail OrderDetail { get; set; }

        public void OnGet(int id)
        {
            OrderDetail = new OrderDetail
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

            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/OrderDetails/CreateOrderDetail", OrderDetail);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while adding the Detail.");
                return Page();
            }
        }
    }
}
