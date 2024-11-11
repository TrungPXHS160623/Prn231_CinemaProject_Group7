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
                foreach (var item in Movies.Categories)
                {
                    var cate = _context.Categories.FirstOrDefault(c => c.CategoryId == item.CategoryId);
                    if (cate != null)
                    {
                        movie.Categories.Add(cate);
                    }
                }
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

        public async Task<List<MovieDTO>> GetAllMovies()
        {
            return await _context.Movies.Select(m => new MovieDTO
            {
                MovieId = m.MovieId,
                Title = m.Title,
                Description = m.Description,
                Duration = m.Duration,
                ReleaseDate = m.ReleaseDate,
                Language = m.Language,
                Director = m.Director,
                Cast = m.Cast,
                AgeRating = m.AgeRating,
                TrailerUrl = m.TrailerUrl,
                PosterUrl = m.PosterUrl,
                IsActive = m.IsActive,
                Categories = m.Categories.Select(c => new CategoryDTO
                {
                    CategoryId = c.CategoryId,
                    CategoryName = c.CategoryName,
                    Description = c.Description,
                    CreatedAt = c.CreatedAt,
                    UpdatedAt = c.UpdatedAt,
                    IsActive = c.IsActive
                }).ToList(),
            })
                .ToListAsync();
        }

        public MovieDTO? GetMovies(int id)
        {
            return _context.Movies
                .Select(m => new MovieDTO
                {
                    MovieId = m.MovieId,
                    Title = m.Title,
                    Description = m.Description,
                    Duration = m.Duration,
                    ReleaseDate = m.ReleaseDate,
                    Language = m.Language,
                    Director = m.Director,
                    Cast = m.Cast,
                    AgeRating = m.AgeRating,
                    TrailerUrl = m.TrailerUrl,
                    PosterUrl = m.PosterUrl,
                    IsActive = m.IsActive,
                    Categories = m.Categories.Select(c => new CategoryDTO
                    {
                        CategoryId = c.CategoryId,
                        CategoryName = c.CategoryName,
                        Description = c.Description,
                        CreatedAt = c.CreatedAt,
                        UpdatedAt = c.UpdatedAt,
                        IsActive = c.IsActive
                    }).ToList(),
                }).Where(m => m.MovieId == id).FirstOrDefault();
        }

        public async Task<bool> UpdateMovies(int id, MovieDTO Movies)
        {
            try
            {
                var data = await _context.Movies.Where(m => m.MovieId == id).FirstAsync();
                if (data == null)
                {
                    return false;
                }
                else
                {
                    data.Title = Movies.Title;
                    data.Description = Movies.Description;
                    data.Duration = Movies.Duration;
                    data.ReleaseDate = Movies.ReleaseDate;
                    data.Language = Movies.Language;
                    data.Director = Movies.Director;
                    data.AgeRating = Movies.AgeRating;
                    data.Cast = Movies.Cast;
                    data.IsActive = Movies.IsActive;
                    data.UpdatedAt = DateTime.Now;

                    _context.Movies.Update(data);
                    await _context.SaveChangesAsync();
                    return true;
                }
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
