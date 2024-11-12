namespace WebClient.DTO
{
    public class AddSeatRequestDto
    {
        public string SeatNumber { get; set; } // Số ghế
        public string RowName { get; set; }     // Tên hàng ghế
        public bool IsActive { get; set; }      // Trạng thái ghế (hoạt động hay không)
        public int RoomId { get; set; }         // Id phòng chiếu mà ghế thuộc về
        public int SeatTypeId { get; set; }     // Loại ghế (VIP, thường, ...)
    }
}
