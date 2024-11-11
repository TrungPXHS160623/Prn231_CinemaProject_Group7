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

        public void OnGet()
        {
            int count = 0;
            MoviesNow = new List<Movie>();
            MoviesUp = new List<Movie>();
            News = new List<News>();
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5280/api/Movie/GetAllMovies").Result;
            var movies = response.Content.ReadFromJsonAsync<List<Movie>>().Result;
            ViewData["movies"] = movies.ToList();
            foreach (var movie in movies)
            {
                if (movie.IsActive == true)
                {
                    if (count == 5) break;
                    count++;
                    MoviesNow.Add(movie);
                }
            }
            count = 0;
            foreach (var movie in movies)
            {
                if (movie.IsActive == false)
                {
                    if (count == 5) break;
                    if (movie.ReleaseDate > DateTime.Now)
                    {
                        count++;
                        MoviesUp.Add(movie);
                    }
                }
            }
            response = _httpClient.GetAsync("http://localhost:5280/api/Category/GetAllCategories").Result;
            var categories = response.Content.ReadFromJsonAsync<List<Category>>().Result;
            ViewData["categories"] = categories.ToList();
        }
    }
}
