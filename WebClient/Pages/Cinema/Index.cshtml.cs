using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Cinema
{
    public class IndexModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public IndexModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public IList<Movie> MoviesNow { get; set; }
        public IList<Movie> MoviesUp { get; set; }
        public IList<News> News { get; set; }
    }
}
