using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.Orders
{
    public class AddModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public AddModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public Order Order { get; set; } = new Order();

        [BindProperty]
        public bool IsPaid { get; set; } = false;

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            // Calculate TotalAmount
            Order.TotalAmount = CalculateTotalAmount(Order);
            Order.IsPaid = IsPaid;

            // Save Order to the database using API
            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/Orders/CreateOrder", Order);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while adding the order.");
                return Page();
            }
        }

        private decimal CalculateTotalAmount(Order order)
        {
            decimal totalAmount = 0;

            // Add OrderConcessions and OrderDetails amounts
            foreach (var concession in order.OrderConcessions)
            {
                totalAmount += concession.Price * concession.Quantity;
            }

            foreach (var detail in order.OrderDetails)
            {
                totalAmount += detail.Price * detail.Quantity;
            }

            // Apply Coupon discount if applicable using API
            if (order.CouponId.HasValue)
            {
                var couponResponse = _httpClient.GetFromJsonAsync<Coupon>($"http://localhost:5280/api/Coupons/GetCoupon{order.CouponId.Value}").Result;
                if (couponResponse != null)
                {
                    totalAmount -= couponResponse.Discount;
                }
            }

            // Apply GiftCard discount if applicable using API
            if (order.GiftCardId.HasValue)
            {
                var giftCardResponse = _httpClient.GetFromJsonAsync<GiftCard>($"http://localhost:5280/api/GiftCards/GiftCard{order.GiftCardId.Value}").Result;
                if (giftCardResponse != null)
                {
                    totalAmount -= giftCardResponse.Balance;
                }
            }

            return totalAmount;
        }
    }
}