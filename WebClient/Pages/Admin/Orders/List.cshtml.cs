using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.Orders
{
    public class ListModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public ListModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public IList<Order> Orders { get; set; }

        public async Task OnGetAsync()
        {
            Orders = await _httpClient.GetFromJsonAsync<IList<Order>>("http://localhost:5280/api/Orders/GetAllOrders");
        }
    }
}
