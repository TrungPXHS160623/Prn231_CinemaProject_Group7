using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
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
        public OrderDetail OrderDetail { get; set; } = new OrderDetail();

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

            OrderDetail = await _httpClient.GetFromJsonAsync<OrderDetail>($"http://localhost:5280/api/OrderDetails/GetOrderDetail/{id}");

            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Seat/{OrderDetail.SeatId}/unreserve", new { });

            var showtime = await _httpClient.GetFromJsonAsync<Showtime>($"http://localhost:5280/api/Showtime/{OrderDetail.ShowtimeId}");

            SelectedTheaterId = showtime.TheaterId;
            SelectedMovieId = showtime.MovieId;

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            var couponResponse = _httpClient.GetFromJsonAsync<Seat>($"http://localhost:5280/api/Seat/{OrderDetail.SeatId}").Result;
            if (couponResponse != null)
            {
                OrderDetail.Price = (decimal)(couponResponse.Price * OrderDetail.Quantity);
            }
            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/OrderDetails/UpdateOrderDetail/{OrderDetail.OrderDetailId}", OrderDetail);

            if (response.IsSuccessStatusCode)
            {
                response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Seat/{OrderDetail.SeatId}/reserve", new { });
                if (response.IsSuccessStatusCode)
                    return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while saving the Detail.");
            }
            return Page();
        }
    }
}