using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface IRoomRepository
    {
        // Thêm một phòng mới
        Task<Room> AddRoom(Room room);

        // Cập nhật thông tin phòng
        Task<Room?> UpdateRoom(Room room);

        // Xóa phòng theo ID
        Task<bool> DeleteRoom(int roomId);

        // Lấy thông tin phòng theo ID
        Task<Room?> GetRoomById(int roomId);

        // Lấy danh sách tất cả các phòng
        Task<List<Room>> GetAllRooms();

        // Lấy danh sách phòng theo rạp chiếu (TheaterId)
        Task<List<Room>> GetRoomsByTheaterId(int theaterId);

        // Lấy danh sách các phòng đang hoạt động
        Task<List<Room>> GetActiveRooms();

        // Vô hiệu hóa phòng
        Task<Room?> DeactivateRoom(int roomId);

        // Kiểm tra phòng có tồn tại theo ID
        Task<bool> RoomExists(int roomId);

        // Kiểm tra xem phòng có đủ sức chứa cho một số lượng ghế cụ thể
        Task<bool> HasEnoughCapacity(int roomId, int requiredSeats);
    }
}
