using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.Movies
{
    public class ListModel : PageModel
    {
        public void OnGet()
        {
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5280/api/Movie/GetAllMovies").Result;
            var movies = response.Content.ReadFromJsonAsync<List<Movie>>().Result;
            ViewData["movies"] = movies.ToList();
            response = _httpClient.GetAsync("http://localhost:5280/api/Category/GetAllCategories").Result;
            var categories = response.Content.ReadFromJsonAsync<List<Category>>().Result;
            ViewData["categories"] = categories.ToList();            
        }
    }
}
