using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class NewsRepository : INewsRepository
    {
        private readonly Prn231_Project_FinalContext _context;

        public NewsRepository(Prn231_Project_FinalContext _context)
        {
            this._context = _context;
        }

        public async Task<bool> CreateNews(NewsDTO News)
        {
            try
            {
                var data = new News
                {
                    
                };
                _context.News.Add(data);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> DeleteNews(int id)
        {
            try
            {
                var News = await _context.News.FindAsync(id);
                if (News == null)
                {
                    return false;
                }
                News.IsActive = false;
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<List<News>> GetAllNews()
        {
            return await _context.News.ToListAsync();
        }

        public async Task<News?> GetNews(int id)
        {
            return await _context.News.FirstOrDefaultAsync(x => x.NewsId == id);
        }

        public async Task<bool> UpdateNews(int id, NewsDTO News)
        {
            try
            {
                var data = await _context.News.FindAsync(id);
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
    }
}
