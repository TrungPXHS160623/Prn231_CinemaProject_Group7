using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.DTO;

namespace WebClient.Pages.Cinema
{
    public class MoviesModel : PageModel
    {
        public void OnGet()
        {
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5280/api/Movie/GetAllMovies").Result;
            var movies = response.Content.ReadFromJsonAsync<List<MovieDTO>>().Result;
            ViewData["movies"] = movies.ToList();
            response = _httpClient.GetAsync("http://localhost:5280/api/Category/GetAllCategories").Result;
            var categories = response.Content.ReadFromJsonAsync<List<CategoryDTO>>().Result;
            ViewData["categories"] = categories.ToList();
        }
    }
}
