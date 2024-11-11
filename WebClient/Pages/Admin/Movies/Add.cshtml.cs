using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Net.Http;
using WebClient.DTO;
using WebClient.Models;

namespace WebClient.Pages.Admin.Movies
{
    public class AddModel : PageModel
    {
        public void OnGet()
        {
            HttpClient _httpClient = new HttpClient();
            var response = _httpClient.GetAsync("http://localhost:5280/api/Category/GetAllCategories").Result;
            var categories = response.Content.ReadFromJsonAsync<List<Category>>().Result;
            ViewData["categories"] = categories.ToList();
        }
        public async Task<IActionResult> OnPost(int movieId, string title, string? description, int duration, DateTime? releaseDate, string? language, string? director, string? cast, string? ageRating, string? trailerUrl, string? posterUrl, bool? isActive, List<int> selectedOptions)
        {
            HttpClient _httpClient = new HttpClient();
            var response = _httpClient.GetAsync("http://localhost:5280/api/Category/GetAllCategories").Result;
            var categories = response.Content.ReadFromJsonAsync<List<CategoryDTO>>().Result;
            ViewData["categories"] = categories.ToList();

            MovieDTO movieDTO = new MovieDTO()
            {
                MovieId = movieId,
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
                Categories=new List<CategoryDTO>()
            };
            foreach (var category in categories)
            {
                if (selectedOptions.Contains(category.CategoryId))
                {
                    movieDTO.Categories.Add(category);
                }
            }

            HttpResponseMessage response2 = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Movie/AddMovie", movieDTO);
            if (response2.IsSuccessStatusCode)
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

