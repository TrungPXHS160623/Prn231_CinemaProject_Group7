using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Cinema
{
    public class NewsModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public NewsModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public IList<News> News { get; set; }
        public async Task OnGetAsync()
        {
            var data = await _httpClient.GetFromJsonAsync<IList<News>>("http://localhost:5280/api/News/GetAllNews");
            News = data.OrderByDescending(x => x.PublishedDate).ToList();
        }
    }
}
