using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Cinema
{
    public class MyTicketModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public MyTicketModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public List<Order> Orders { get; set; }

        public async Task OnGetAsync(int id)
        {
            var data = await _httpClient.GetFromJsonAsync<List<Order>>($"http://localhost:5280/api/Orders/GetOrdersByCustomerId/1");
            Orders = data.Where(x => x.StatusId != 3).OrderByDescending(x => x.OrderDate).ToList();
        }
    }
}
