using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.News
{
    public class ListModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public ListModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public IList<WebClient.Models.News> News { get; set; }

        public async Task OnGetAsync()
        {
            News = await _httpClient.GetFromJsonAsync<IList<WebClient   .Models.News>>("http://localhost:5280/api/News/GetAllNews");
        }
    }
}
