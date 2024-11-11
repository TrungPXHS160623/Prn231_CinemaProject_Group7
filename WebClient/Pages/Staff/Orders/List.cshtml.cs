using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Staff.Orders
{
    public class ListModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public ListModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public List<Order> Orders { get; set; }

        public async Task OnGetAsync()
        {
            var data = await _httpClient.GetFromJsonAsync<List<Order>>("http://localhost:5280/api/Orders/GetAllOrders");
            Orders = data.Where(x => x.StatusId != 3).ToList();
        }
    }
}