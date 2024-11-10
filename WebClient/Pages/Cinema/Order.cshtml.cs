using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Net.Http;
using WebClient.Models;

namespace WebClient.Pages.Cinema
{
    public class OrderModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public OrderModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public Order Order { get; set; } = new Order();
        public List<Coupon> Coupons { get; set; }
        public List<GiftCard> GiftCards { get; set; }
        public async Task<IActionResult> OnGet()
        {
            Coupons = await _httpClient.GetFromJsonAsync<List<Coupon>>("http://localhost:5280/api/Coupons/GetAllCoupons");
            Coupons = Coupons.Where(c => c.IsActive == true).ToList();
            GiftCards = await _httpClient.GetFromJsonAsync<List<GiftCard>>("http://localhost:5280/api/GiftCards/GetAllGiftCards");
            GiftCards = GiftCards.Where(c => c.IsActive == true).ToList();
            return Page();
        }

        public async Task<IActionResult> OnPost()
        {
            Order.CustomerId = 1;
            Order.StatusId = 4;
            Order.TotalAmount = CalculateTotalAmount(Order);
            Order.IsPaid = false;

            // Save Order to the database using API
            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/Orders/CreateOrder", Order);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./MyTicket");
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
                    totalAmount = totalAmount * ((100 - couponResponse.Discount) / 100);
                }
            }

            // Apply GiftCard discount if applicable using API
            if (order.GiftCardId.HasValue)
            {
                var giftCardResponse = _httpClient.GetFromJsonAsync<GiftCard>($"http://localhost:5280/api/GiftCards/GetGiftCard{order.GiftCardId.Value}").Result;
                if (giftCardResponse != null)
                {
                    totalAmount -= giftCardResponse.Balance;
                }
            }

            return totalAmount;
        }
    }
}
