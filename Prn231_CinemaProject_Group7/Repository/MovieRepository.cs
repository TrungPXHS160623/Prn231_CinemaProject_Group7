using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class MovieRepository : IMovieRepository
    {
        private readonly Prn231_Project_FinalContext _context;
        public MovieRepository(Prn231_Project_FinalContext context)
        {
            this._context = context;
        }

        public async Task<bool> CreateMovies(MovieDTO Movies)
        {
            try
            {
                var movie = new Movie
                {
                    Title = Movies.Title,
                    Description = Movies.Description,
                    Duration = Movies.Duration,
                    ReleaseDate = Movies.ReleaseDate,
                    Language = Movies.Language,
                    Director = Movies.Director,
                    Cast = Movies.Cast,
                    AgeRating = Movies.AgeRating,
                    TrailerUrl = Movies.TrailerUrl,
                    PosterUrl = Movies.PosterUrl,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now,
                    IsActive = Movies.IsActive,
                };
                _context.Movies.Add(movie);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> ChangeStatus(int id)
        {
            try
            {
                var movie = await _context.Movies.FindAsync(id);
                if (movie == null)
                {
                    return false;
                }
                movie.IsActive = !movie.IsActive;
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<List<Movie>> GetAllMovies()
        {
            return await _context.Movies.ToListAsync();
        }

        public Movie? GetMovies(int id)
        {
            return _context.Movies.FirstOrDefault(m => m.MovieId == id); ;
        }

        public async Task<bool> UpdateMovies(int id, MovieDTO Movies)
        {
            try
            {
                var data = await _context.Movies.FindAsync(id);
                if (data == null)
                {
                    return false;
                }
                
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> EditCategories(int id, List<int> categories)
        {
            var movie = await _context.Movies.Include(m => m.Categories).FirstOrDefaultAsync(m => m.MovieId == id);
            if (movie == null)
            {
                return false;
            }

            // Remove existing categories
            movie.Categories.Clear();

            // Add new categories
            foreach (var categoryId in categories)
            {
                var category = await _context.Categories.FindAsync(categoryId);
                if (category != null)
                {
                    movie.Categories.Add(category);
                }
            }

            _context.Movies.Update(movie);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
