using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Net.Http;
using System.Text.Json;
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
        public int ShowtimeId { get; set; }
        [BindProperty]
        public List<int> SeatIds { get; set; } = new List<int>();
        public List<Coupon> Coupons { get; set; }
        public List<GiftCard> GiftCards { get; set; }
        [BindProperty]
        public List<OrderConcession> SelectedConcessions { get; set; } = new List<OrderConcession>();
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
            Order.OrderDate = DateTime.Now;
            Order.IsPaid = false;
            Order.PaymentMethod = "Transfer";
            foreach (var selectedConcession in SelectedConcessions)
            {
                Order.OrderConcessions.Add(new OrderConcession
                {
                    ConcessionId = selectedConcession.ConcessionId,
                    Quantity = selectedConcession.Quantity,
                    Price = GetConcessionPrice(selectedConcession.ConcessionId, selectedConcession.Quantity)
                });
            }
            foreach (var seatId in SeatIds)
            {
                Order.OrderDetails.Add(new OrderDetail
                {
                    SeatId = seatId,
                    ShowtimeId = ShowtimeId,
                    Quantity = 1,
                    Price = GetSeatPrice(seatId)
                });
            }
            Order.TotalAmount = CalculateTotalAmount(Order);
            Order.IsPaid = false;
            var data = JsonSerializer.Serialize(Order);
            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/Orders/CreateOrder", Order);

            if (response.IsSuccessStatusCode)
            {

                return RedirectToPage("./MyTicket");
            }
            else
            {

                ModelState.AddModelError(string.Empty, "An error occurred while adding the order.");
                return RedirectToPage();
            }
        }
        private decimal GetSeatPrice(int seatId)
        {
            var couponResponse = _httpClient.GetFromJsonAsync<Seat>($"http://localhost:5280/api/Seat/{seatId}").Result;
            if (couponResponse == null)
            {
                return 0;
            }
            return (decimal)couponResponse.Price;
        }
        private decimal GetConcessionPrice(int seatId, int quatity)
        {
            var couponResponse = _httpClient.GetFromJsonAsync<Concession>($"http://localhost:5280/api/Concessions/GetConcession/{seatId}").Result;
            if (couponResponse == null)
            {
                return 0;
            }
            return couponResponse.Price * quatity;
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
                var couponResponse = _httpClient.GetFromJsonAsync<Coupon>($"http://localhost:5280/api/Coupons/GetCoupon/{order.CouponId.Value}").Result;
                if (couponResponse != null)
                {
                    totalAmount = totalAmount * ((100 - couponResponse.Discount) / 100);
                }
            }

            // Apply GiftCard discount if applicable using API
            if (order.GiftCardId.HasValue)
            {
                var giftCardResponse = _httpClient.GetFromJsonAsync<GiftCard>($"http://localhost:5280/api/GiftCards/GetGiftCard/{order.GiftCardId.Value}").Result;
                if (giftCardResponse != null)
                {
                    totalAmount -= giftCardResponse.Balance;
                }
            }

            return totalAmount;
        }
    }
}
