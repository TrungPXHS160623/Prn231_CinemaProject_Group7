using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface IMovieRepository
    {
        Task<List<MovieDTO>> GetAllMovies();
        MovieDTO? GetMovies(int id);
        Task<bool> CreateMovies(MovieDTO Movies);
        Task<bool> UpdateMovies(int id, MovieDTO Movies);
        Task<bool> ChangeStatus(int id);

        Task<bool> EditCategories(int id,List<int> categories);
    }
}
