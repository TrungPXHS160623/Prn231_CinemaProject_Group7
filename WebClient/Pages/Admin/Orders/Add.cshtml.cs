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
        public bool IsPaid { get; set; }
        //public List<User> Customers { get; set; }
        public List<OrderStatus> Statuses { get; set; }
        public List<Coupon> Coupons { get; set; }
        public List<GiftCard> GiftCards { get; set; }
        public IList<Concession> Concessions { get; set; }
        public async Task<IActionResult> OnGetAsync()
        {
            //Customers = await _httpClient.GetFromJsonAsync<List<User>>("http://localhost:5280/api/Users");
            Coupons = await _httpClient.GetFromJsonAsync<List<Coupon>>("http://localhost:5280/api/Coupons/GetAllCoupons");
            Coupons = Coupons.Where(c => c.IsActive == true).ToList();
            GiftCards = await _httpClient.GetFromJsonAsync<List<GiftCard>>("http://localhost:5280/api/GiftCards/GetAllGiftCards");
            GiftCards = GiftCards.Where(c => c.IsActive == true).ToList();
            Statuses = new List<OrderStatus>()
            {
                new OrderStatus { StatusId = 1, StatusName = "Active" },
                new OrderStatus { StatusId = 2, StatusName = "Used" },
                new OrderStatus { StatusId = 3, StatusName = "Canceled" },
                new OrderStatus { StatusId = 4, StatusName = "NotPay" }
            };
            Concessions = await _httpClient.GetFromJsonAsync<IList<Concession>>("http://localhost:5280/api/Concessions/GetAllConcessions");
            Concessions = Concessions.Where(c => c.IsActive == true).ToList();
            return Page();
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