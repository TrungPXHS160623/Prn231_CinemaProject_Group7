using Microsoft.AspNetCore.Mvc.RazorPages;
using Prn231_CinemaProject_Group7.Models;

namespace WebClient.Pages.Admin.Coupons
{
    public class ListModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public ListModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public IList<Coupon> Coupons { get; set; }

        public async Task OnGetAsync()
        {
            Coupons = await _httpClient.GetFromJsonAsync<IList<Coupon>>("http://localhost:5280/api/Coupons/GetAllCoupons");
        }
    }
}
