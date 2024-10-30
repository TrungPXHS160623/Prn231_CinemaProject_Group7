using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface INewsRepository
    {
        Task<List<News>> GetAllNews();
        Task<News> GetNews(int id);
        Task<bool> CreateNews(NewsDTO news);
        Task<bool> UpdateNews(int id, NewsDTO news);
        Task<bool> DeleteNews(int id);
    }
}
