using Microsoft.AspNetCore.Mvc.RazorPages;
using Prn231_CinemaProject_Group7.Models;

namespace WebClient.Pages.Admin.News
{
    public class ListModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public ListModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public IList<Prn231_CinemaProject_Group7.Models.News> News { get; set; }

        public async Task OnGetAsync()
        {
            News = await _httpClient.GetFromJsonAsync<IList<Prn231_CinemaProject_Group7.Models.News>>("http://localhost:5280/api/News/GetAllNews");
        }
    }
}
