using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Models.Dtos.ShowtimeDtos;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class ShowtimeRepository : IShowtimeRepository

    {
        private readonly Prn231_Project_FinalContext dbContext;

        public ShowtimeRepository(Prn231_Project_FinalContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public async Task<Showtime> AddShowtime(Showtime showtime)
        {
            // Kiểm tra xem MovieId có tồn tại trong bảng Movies không
            var movieExists = await dbContext.Movies.AnyAsync(m => m.MovieId == showtime.MovieId);
            if (!movieExists)
            {
                throw new ArgumentException("MovieId không tồn tại.");
            }

            // Kiểm tra xem RoomId có tồn tại trong bảng Rooms không
            var roomExists = await dbContext.Rooms.AnyAsync(r => r.RoomId == showtime.RoomId);
            if (!roomExists)
            {
                throw new ArgumentException("RoomId không tồn tại.");
            }

            // Nếu MovieId và RoomId hợp lệ, thêm suất chiếu vào DbSet
            await dbContext.Showtimes.AddAsync(showtime);
            await dbContext.SaveChangesAsync();

            return showtime;
        }

        public async Task<Showtime?> DeactivateShowtime(int showtimeId)
        {
            // Tìm suất chiếu theo showtimeId
            var showtime = await dbContext.Showtimes.FirstOrDefaultAsync(s => s.ShowtimeId == showtimeId);

            // Nếu không tìm thấy suất chiếu, trả về null
            if (showtime == null)
            {
                return null;
            }

            // Vô hiệu hóa suất chiếu
            showtime.IsActive = false;
            await dbContext.SaveChangesAsync();

            return showtime;
        }

        public async Task<bool> DeleteShowtime(int showtimeId)
        {
            // Tìm suất chiếu theo showtimeId
            var showtime = await dbContext.Showtimes.FirstOrDefaultAsync(s => s.ShowtimeId == showtimeId);

            // Nếu không tìm thấy suất chiếu, trả về false
            if (showtime == null)
            {
                return false;
            }

            // Xóa suất chiếu khỏi DbSet
            dbContext.Showtimes.Remove(showtime);
            await dbContext.SaveChangesAsync();

            return true;
        }

        public async Task<List<Showtime>> GetActiveShowtimes()
        {
            // Truy xuất danh sách suất chiếu đang hoạt động từ cơ sở dữ liệu
            return await dbContext.Showtimes
                .Where(s => s.IsActive == true) 
                .ToListAsync();
        }

        public async Task<List<Showtime>> GetAllShowtimes()
        {
            // Truy xuất tất cả suất chiếu từ cơ sở dữ liệu
            return await dbContext.Showtimes.ToListAsync();
        }

        public async Task<ShowtimeDto> GetShowtimeById(int showtimeId)
        {
            // Tìm suất chiếu theo ID
            var showtime = await dbContext.Showtimes
                .Select(st => new ShowtimeDto
                {
                    ShowtimeId = st.ShowtimeId,
                    MovieId = st.MovieId,
                    RoomId = st.RoomId,
                    StartTime = st.StartTime,
                    EndTime = st.EndTime,
                    IsActive = st.IsActive,
                    TheaterId = st.Room.TheaterId
                })
                .FirstOrDefaultAsync(s => s.ShowtimeId == showtimeId);

            return showtime;
        }

        public async Task<List<Showtime>> GetShowtimesByDate(DateTime date)
        {
            // Lấy danh sách các suất chiếu theo ngày cụ thể
            var showtimes = await dbContext.Showtimes
                .Where(s => s.StartTime.Date == date.Date && s.IsActive == true) // Lọc theo ngày và trạng thái kích hoạt
                .ToListAsync();

            return showtimes;
        }

        public async Task<List<Showtime>> GetShowtimesByMovieId(int movieId)
        {
            // Truy vấn danh sách các suất chiếu dựa theo movieId
            var showtimes = await dbContext.Showtimes
                .Where(s => s.MovieId == movieId && s.IsActive == true) // Lọc theo movieId và các suất chiếu đang hoạt động
                .ToListAsync();

            return showtimes;
        }
        public async Task<List<ShowtimeDto>> GetShowTimeByMovieTheater(int movieId, int theaterId)
        {
            var showtimes = await dbContext.Showtimes
                .Include(s => s.Room)
                .Where(s => s.MovieId == movieId && s.IsActive == true && s.Room.Theater.TheaterId == theaterId)
                .Select(x => new ShowtimeDto {
                    ShowtimeId = x.ShowtimeId,
                    MovieId = x.MovieId,
                    RoomId = x.RoomId,
                    StartTime = x.StartTime,
                    EndTime = x.EndTime,
                    IsActive = x.IsActive,
                    RoomeName = x.Room.Name
                })
                .ToListAsync();

            return showtimes;
        }

        public async Task<bool> IsShowtimeAvailable(int roomId, DateTime startTime, DateTime endTime)
        {
            // Lấy danh sách các suất chiếu trong phòng
            var existingShowtimes = await dbContext.Showtimes
                .Where(s => s.RoomId == roomId && s.IsActive == true)
                .ToListAsync();

            // Kiểm tra xem suất chiếu mới có trùng thời gian với bất kỳ suất chiếu nào không
            foreach (var showtime in existingShowtimes)
            {
                if (!(endTime <= showtime.StartTime || startTime >= showtime.EndTime))
                {
                    // Nếu điều kiện không thỏa mãn, tức là có trùng thời gian
                    return false;
                }
            }

            // Nếu không có suất chiếu nào trùng, trả về true
            return true;
        }
        public async Task<List<Showtime>> GetShowtimesByRoomId(int roomId)
        {
            // Lấy danh sách suất chiếu theo roomId
            return await dbContext.Showtimes
                .Where(s => s.RoomId == roomId)
                .ToListAsync();
        }

        public async Task<bool> ShowtimeExists(int showtimeId)
        {
            // Kiểm tra xem suất chiếu có tồn tại theo showtimeId
            return await dbContext.Showtimes.AnyAsync(s => s.ShowtimeId == showtimeId);
        }

        public async Task<Showtime?> UpdateShowtime(Showtime showtime)
        {
            // Tìm suất chiếu theo ShowtimeId
            var existingShowtime = await dbContext.Showtimes.FirstOrDefaultAsync(s => s.ShowtimeId == showtime.ShowtimeId);

            // Nếu không tìm thấy suất chiếu, trả về null
            if (existingShowtime == null)
            {
                return null;
            }

            // Cập nhật các thông tin của suất chiếu
            existingShowtime.MovieId = showtime.MovieId;
            existingShowtime.RoomId = showtime.RoomId;
            existingShowtime.StartTime = showtime.StartTime;
            existingShowtime.EndTime = showtime.EndTime;
            existingShowtime.IsActive = showtime.IsActive;

            // Lưu thay đổi vào cơ sở dữ liệu
            await dbContext.SaveChangesAsync();

            // Trả về suất chiếu đã cập nhật
            return existingShowtime;
        }
    }
}
