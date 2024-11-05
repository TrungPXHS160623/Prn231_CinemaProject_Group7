using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class TheaterRepository : ITheaterRepository
    {
        private readonly Prn231_Project_FinalContext dbContext;

        public TheaterRepository(Prn231_Project_FinalContext _dbContext)
        {
            dbContext = _dbContext;
        }
        // Thêm một rạp chiếu mới
        public async Task<Theater> AddTheater(Theater theater)
        {
            await dbContext.Theaters.AddAsync(theater);
            await dbContext.SaveChangesAsync();
            return theater;
        }

        // Cập nhật thông tin rạp chiếu
        public async Task<Theater?> UpdateTheater(Theater theater)
        {
            var existingTheater = await GetTheaterById(theater.TheaterId);
            if (existingTheater == null)
            {
                return null; // Rạp chiếu không tồn tại
            }

            dbContext.Entry(existingTheater).CurrentValues.SetValues(theater);
            await dbContext.SaveChangesAsync();
            return existingTheater;
        }

        // Xóa rạp chiếu theo ID
        public async Task<bool> DeleteTheater(int theaterId)
        {
            var theater = await GetTheaterById(theaterId);
            if (theater == null)
            {
                return false; // Rạp chiếu không tồn tại
            }

            dbContext.Theaters.Remove(theater);
            await dbContext.SaveChangesAsync();
            return true;
        }

        // Lấy thông tin rạp chiếu theo ID
        public async Task<Theater?> GetTheaterById(int theaterId)
        {
            return await dbContext.Theaters.FindAsync(theaterId);
        }
        
        // Lấy danh sách tất cả các rạp chiếu
        public async Task<List<Theater>> GetAllTheaters()
        {
            return await dbContext.Theaters.ToListAsync();
        }

        // Lấy danh sách các rạp chiếu đang hoạt động
        public async Task<List<Theater>> GetActiveTheaters()
        {
            return await dbContext.Theaters.Where(t => t.IsActive == true).ToListAsync();
        }

        // Kiểm tra rạp chiếu có tồn tại theo ID
        public async Task<bool> TheaterExists(int theaterId)
        {
            return await dbContext.Theaters.AnyAsync(t => t.TheaterId == theaterId);
        }

        // Lấy danh sách các phòng chiếu thuộc một rạp
        public async Task<List<Room>> GetRoomsByTheaterId(int theaterId)
        {
            return await dbContext.Rooms.Where(r => r.TheaterId == theaterId).ToListAsync();
        }
    }
}
