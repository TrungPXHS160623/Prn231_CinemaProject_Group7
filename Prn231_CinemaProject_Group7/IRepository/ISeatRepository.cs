using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface ISeatRepository
    {
        // Thêm ghế mới vào phòng chiếu
        Task<Seat> AddSeat(Seat seat);

        //cập nhật thông tin ghế
        Task<Seat> UpdateSeat(Seat seat);

        //Xoá ghế theo Id
        Task<bool> DeleteSeat(Seat seat);

        //Lấy thông tin tất cả các ghế trong 1 phòng chiếu(theo roomid)
        Task<List<Seat>> GetSeatByRoomId(int roomId);

        //Lấy ghế theo Id
        Task<Seat> GetSeatById(int seatId);

        //Lấy danh sách ghế theo trạng thái hoạt động
        Task<List<Seat>> GetActiveSeatsByRoomId(int roomId);

        //Đánh dấu ghế là không hoạt động (ví dụ khi ghế bị hỏng hoặc bảo trì)
        Task<Seat?> DeactivateSeat(int seatId);

        // Đánh dấu ghế là đang đặt(để quản lý trạng thái khi người dùng đặt vé)
        Task<Seat?> ReserveSeat(int seatId);


        // Hủy đặt ghế (khi người dùng huỷ hoặc hoàn thành giao dịch)
        Task<Seat?> UnreserveSeat(int seatId);


        // Kiểm tra tình trạng ghế (để xem ghế có sẵn để đặt hay không)
        Task<bool> IsSeatAvailable(int seatId);

        // Lấy tất cả ghế trống trong phòng chiếu theo RoomId
        Task<List<Seat>> GetAvailableSeatsByRoomId(int roomId);

        // Tìm kiếm ghế theo loại ghế trong một phòng chiếu
        Task<List<Seat>> GetSeatByShowTime(int showtimeId);
        Task<List<Seat>> SearchSeatsByType(int roomId, int seatTypeId);

        // Lấy tất cả ghế trong hệ thống
        Task<List<Seat>> GetAllSeats();
    }
}
