using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json;
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
        public bool IsPaid { get; set; }
        public List<Coupon> Coupons { get; set; }
        public List<GiftCard> GiftCards { get; set; }
        public IList<Concession> Concessions { get; set; }

        [BindProperty]
        public int SelectedTheaterId { get; set; }

        [BindProperty]
        public int SelectedMovieId { get; set; }

        public List<SelectListItem> Theaters { get; set; }
        public List<SelectListItem> Movies { get; set; }
        public List<SelectListItem> Showtimes { get; set; }
        public List<SelectListItem> Seats { get; set; }
        public async Task<IActionResult> OnGetAsync()
        {
            //Customers = await _httpClient.GetFromJsonAsync<List<User>>("http://localhost:5280/api/Users");
            Coupons = await _httpClient.GetFromJsonAsync<List<Coupon>>("http://localhost:5280/api/Coupons/GetAllCoupons");
            Coupons = Coupons.Where(c => c.IsActive == true).ToList();
            GiftCards = await _httpClient.GetFromJsonAsync<List<GiftCard>>("http://localhost:5280/api/GiftCards/GetAllGiftCards");
            GiftCards = GiftCards.Where(c => c.IsActive == true).ToList();
            Concessions = await _httpClient.GetFromJsonAsync<IList<Concession>>("http://localhost:5280/api/Concessions/GetAllConcessions");
            Concessions = Concessions.Where(c => c.IsActive == true).ToList();
            var theaters = await _httpClient.GetFromJsonAsync<List<Theater>>("http://localhost:5280/api/Theater/active");
            Theaters = theaters.Select(t => new SelectListItem { Value = t.TheaterId.ToString(), Text = t.Name }).ToList();
            Movies = new List<SelectListItem>();
            Showtimes = new List<SelectListItem>();
            Seats = new List<SelectListItem>();
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            // Calculate TotalAmount
            Order.StatusId = 1;
            foreach (var concession in Order.OrderConcessions)
            {
                concession.Price = GetConcessionPrice(concession.ConcessionId, concession.Quantity);
            }
            foreach (var detail in Order.OrderDetails)
            {
                detail.Price = GetSeatPrice(detail.SeatId);
            }
            Order.TotalAmount = CalculateTotalAmount(Order);
            Order.IsPaid = IsPaid;
            var data = JsonSerializer.Serialize(Order);
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