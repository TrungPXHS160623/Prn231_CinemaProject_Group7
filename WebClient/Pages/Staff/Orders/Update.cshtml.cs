using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;
using WebClient.Models;

namespace WebClient.Pages.Staff.Orders
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

        [BindProperty]
        public bool IsPaid { get; set; }
        public int StatusId { get; set; }
        public List<OrderStatus> Statuses { get; set; }
        public List<Coupon> Coupons { get; set; }
        public List<GiftCard> GiftCards { get; set; }
        public IList<Concession> Concessions { get; set; }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            var response = await _httpClient.GetStringAsync($"http://localhost:5280/api/Orders/GetOrder/{id}");
            var jsonDocument = JsonDocument.Parse(response);
            var orderElement = jsonDocument.RootElement.GetProperty("result");

            if (orderElement.ValueKind == JsonValueKind.Null)
            {
                return NotFound();
            }

            Order = new Order
            {
                OrderId = orderElement.GetProperty("orderId").GetInt32(),
                CustomerId = orderElement.GetProperty("customerId").GetInt32(),
                OrderDate = orderElement.GetProperty("orderDate").GetDateTime(),
                TotalAmount = orderElement.GetProperty("totalAmount").GetDecimal(),
                IsPaid = orderElement.TryGetProperty("isPaid", out var isPaidElement) && isPaidElement.ValueKind != JsonValueKind.Null ? isPaidElement.GetBoolean() : false,
                PaymentMethod = orderElement.GetProperty("paymentMethod").GetString(),
                StatusId = orderElement.GetProperty("statusId").GetInt32(),
                CouponId = orderElement.TryGetProperty("couponId", out var couponIdElement) && couponIdElement.ValueKind != JsonValueKind.Null ? couponIdElement.GetInt32() : (int?)null,
                GiftCardId = orderElement.TryGetProperty("giftCardId", out var giftCardIdElement) && giftCardIdElement.ValueKind != JsonValueKind.Null ? giftCardIdElement.GetInt32() : (int?)null
            };

            Statuses = new List<OrderStatus>()
            {
                new OrderStatus { StatusId = 1, StatusName = "Active" },
                new OrderStatus { StatusId = 2, StatusName = "Used" },
                new OrderStatus { StatusId = 4, StatusName = "NotPay" }
            };
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            decimal totalAmount = Order.TotalAmount;

            // Apply Coupon discount if applicable using API
            if (Order.CouponId.HasValue && Order.CouponId.Value != 0)
            {
                var couponResponse = await _httpClient.GetFromJsonAsync<Coupon>($"http://localhost:5280/api/Coupons/GetCoupon/{Order.CouponId.Value}");
                if (couponResponse != null)
                {
                    totalAmount = totalAmount * ((100 - couponResponse.Discount) / 100);
                }
            }

            // Apply GiftCard discount if applicable using API
            if (Order.GiftCardId.HasValue && Order.GiftCardId.Value != 0)
            {
                var giftCardResponse = await _httpClient.GetFromJsonAsync<GiftCard>($"http://localhost:5280/api/GiftCards/GetGiftCard/{Order.GiftCardId.Value}");
                if (giftCardResponse != null)
                {
                    totalAmount -= giftCardResponse.Balance;
                }
            }

            Order.TotalAmount = totalAmount;
            Order.IsPaid = IsPaid;

            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Orders/UpdateOrder/{Order.OrderId}", Order);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while updating the order.");
                return Page();
            }
        }
    }
}
