using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin
{
    public class IndexModel : PageModel
    {
        public List<string> Categories { get; set; } = new();
        public List<int> MovieCounts { get; set; } = new();
        public List<string> SalesDates { get; set; } = new();
        public List<decimal> SalesAmounts { get; set; } = new();
        public List<string> Rooms { get; set; } = new();
        public List<int?> RoomUtilization { get; set; } = new();

        private readonly HttpClient _httpClient;

        public IndexModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task OnGetAsync()
        {
            var categories = await _httpClient.GetFromJsonAsync<List<Category>>("http://localhost:5280/api/Category/GetAllCategories");
            MovieCounts = await _httpClient.GetFromJsonAsync<List<int>>("http://localhost:5280/api/Category/GetMovieCountByCategories");
            var orders = await _httpClient.GetFromJsonAsync<List<Order>>("http://localhost:5280/api/Orders/GetAllOrders");
            var rooms = await _httpClient.GetFromJsonAsync<List<Room>>("http://localhost:5280/api/Room/active");
            Categories = categories.Where(c => c.IsActive == true).Select(c => c.CategoryName).ToList();
            SalesDates = orders.Where(o => o.IsPaid == true).Select(o => o.OrderDate.Value.ToString("dd/MM/yyyy")).ToList();
            SalesAmounts = orders.Where(o => o.IsPaid == true).Select(o => o.TotalAmount).ToList();
            Rooms = rooms.Select(o => o.Name).ToList();
            RoomUtilization = rooms.Select(r => r.RoomUtilazation).ToList();
        }
    }
}