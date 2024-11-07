using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
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

        [BindProperty]
        public int SelectedTheaterId { get; set; }

        [BindProperty]
        public int SelectedMovieId { get; set; }

        public List<SelectListItem> Theaters { get; set; }
        public List<SelectListItem> Movies { get; set; }
        public List<SelectListItem> Showtimes { get; set; }
        public List<SelectListItem> Seats { get; set; }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            var theaters = await _httpClient.GetFromJsonAsync<List<Theater>>("http://localhost:5280/api/Theater/active");
            Theaters = theaters.Select(t => new SelectListItem { Value = t.TheaterId.ToString(), Text = t.Name }).ToList();
            Movies = new List<SelectListItem>();
            Showtimes = new List<SelectListItem>();
            Seats = new List<SelectListItem>();
            OrderDetail.OrderId = id;
            return Page();
        }
        public async Task<IActionResult> OnPostAsync()
        {
            var couponResponse = _httpClient.GetFromJsonAsync<Seat>($"http://localhost:5280/api/Seat/{OrderDetail.SeatId}").Result;
            if (couponResponse != null)
            {
                OrderDetail.Price = (decimal)(couponResponse.Price * OrderDetail.Quantity);
            }
            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/OrderDetails/CreateOrderDetail", OrderDetail);

            if (response.IsSuccessStatusCode)
            {
                response = await _httpClient.PostAsJsonAsync($"http://localhost:5280/api/Seat/{OrderDetail.SeatId}/reserve", OrderDetail);
                if(response.IsSuccessStatusCode)
                    return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while adding the Detail.");
            }
            return RedirectToPage();
        }
    }
}
