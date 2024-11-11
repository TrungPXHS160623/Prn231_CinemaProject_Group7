using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.VisualBasic;
using WebClient.DTO;
using WebClient.Models;


namespace WebClient.Pages.Admin.Movies
{
    public class UpdateModel : PageModel
    {
        public void OnGet(int id)
        {
            HttpClient _httpClient = new HttpClient();

            HttpResponseMessage response0 = _httpClient.GetAsync($"http://localhost:5280/api/Movie/GetMovie/{id}").Result;
            var movies = response0.Content.ReadFromJsonAsync<MovieDTO>().Result;
            ViewData["movies"] = movies;

            HttpResponseMessage response1 = _httpClient.GetAsync("http://localhost:5280/api/Category/GetAllCategories").Result;
            var categories = response1.Content.ReadFromJsonAsync<List<Category>>().Result;
            ViewData["categories"] = categories.ToList();
        }
        public async Task<IActionResult> OnPost(int movieId, string title, string? description, int duration, DateTime? releaseDate, string? language, string? director, string? cast, string? ageRating, string? trailerUrl, string? posterUrl, bool? isActive, List<int> selectedOptions)
        {
            HttpClient _httpClient = new HttpClient();

            HttpResponseMessage response = _httpClient.GetAsync($"http://localhost:5280/api/Movie/GetMovie/{movieId}").Result;
            var movies = response.Content.ReadFromJsonAsync<MovieDTO>().Result;
            ViewData["movies"] = movies;

            HttpResponseMessage response1 = _httpClient.GetAsync("http://localhost:5280/api/Category/GetAllCategories").Result;
            var categories = response1.Content.ReadFromJsonAsync<List<Category>>().Result;
            ViewData["categories"] = categories.ToList();
            MovieDTO movieDTO = new MovieDTO()
            {
                MovieId=0,
                Title = title,
                Description = description,
                Duration = duration,
                ReleaseDate = releaseDate,
                Language = language,
                Director = director,
                Cast = cast,
                AgeRating = ageRating,
                TrailerUrl = trailerUrl,
                PosterUrl = posterUrl,
                IsActive = true,
                Categories = new List<CategoryDTO>()
            };

            HttpResponseMessage response2 = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Movie/UpdateMovie/{movieId}", movieDTO);
            HttpResponseMessage response3 = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Movie/UpdateCategory/{movieId}", selectedOptions);
            if (response2.IsSuccessStatusCode && response3.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                return Page();
            }
        }
    }
}
