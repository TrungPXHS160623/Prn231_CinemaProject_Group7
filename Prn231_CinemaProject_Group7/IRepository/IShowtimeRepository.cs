using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface IShowtimeRepository
    {
        Task<Showtime> AddShowtime(Showtime showtime); // Thêm một suất chiếu mới
        Task<Showtime?> UpdateShowtime(Showtime showtime); // Cập nhật thông tin suất chiếu
        Task<bool> DeleteShowtime(int showtimeId); // Xóa suất chiếu theo ID
        Task<Showtime?> DeactivateShowtime(int showtimeId); // Vô hiệu hóa suất chiếu theo ID
        Task<Showtime?> GetShowtimeById(int showtimeId); // Lấy thông tin suất chiếu theo ID
        Task<List<Showtime>> GetAllShowtimes(); // Lấy danh sách tất cả suất chiếu
        Task<List<Showtime>> GetActiveShowtimes(); // Lấy danh sách các suất chiếu đang hoạt động
        Task<List<Showtime>> GetShowtimesByRoomId(int roomId); // Lấy các suất chiếu theo ID phòng
        Task<List<Showtime>> GetShowtimesByMovieId(int movieId); // Lấy các suất chiếu theo ID phim
        Task<bool> IsShowtimeAvailable(int roomId, DateTime startTime, DateTime endTime); // Kiểm tra suất chiếu có trùng thời gian
        Task<bool> ShowtimeExists(int showtimeId); // Kiểm tra suất chiếu có tồn tại
        Task<List<Showtime>> GetShowtimesByDate(DateTime date); // Lấy các suất chiếu theo ngày
    }
}
