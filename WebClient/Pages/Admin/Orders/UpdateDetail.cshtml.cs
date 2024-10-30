using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.Orders
{
    public class UpdateDetailModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public UpdateDetailModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public OrderDetail OrderDetail { get; set; }

        [BindProperty]
        public bool IsActive { get; set; }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            var OrderDetail = await _httpClient.GetFromJsonAsync<OrderDetail>($"http://localhost:5280/api/OrderDetails/GetOrderDetail/{id}");
            if (OrderDetail == null)
            {
                return NotFound();
            }

            OrderDetail = OrderDetail;

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/OrderDetails/UpdateOrderDetail/{OrderDetail.OrderDetailId}", OrderDetail);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while updating the OrderDetail.");
                return Page();
            }
        }
    }
}
