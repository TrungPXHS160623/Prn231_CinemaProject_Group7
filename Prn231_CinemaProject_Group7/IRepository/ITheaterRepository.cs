using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface ITheaterRepository
    {
        // Thêm một rạp chiếu mới
        Task<Theater> AddTheater(Theater theater);

        // Cập nhật thông tin rạp chiếu
        Task<Theater?> UpdateTheater(Theater theater);

        // Xóa rạp chiếu theo ID
        Task<bool> DeleteTheater(int theaterId);

        // Lấy thông tin rạp chiếu theo ID
        Task<Theater?> GetTheaterById(int theaterId);

        // Lấy danh sách tất cả các rạp chiếu
        Task<List<Theater>> GetAllTheaters();

        // Lấy danh sách các rạp chiếu đang hoạt động
        Task<List<Theater>> GetActiveTheaters();

        // Kiểm tra rạp chiếu có tồn tại theo ID
        Task<bool> TheaterExists(int theaterId);

        // Lấy danh sách các phòng chiếu thuộc một rạp
        Task<List<Room>> GetRoomsByTheaterId(int theaterId);
    }
}
