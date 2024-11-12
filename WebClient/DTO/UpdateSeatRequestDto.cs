namespace WebClient.DTO
{
    public class UpdateSeatRequestDto
    { 
        public string SeatNumber { get; set; }  // Số ghế mới
        public string RowName { get; set; }     // Tên hàng ghế mới
        public bool? IsActive { get; set; }      // Trạng thái ghế mới
        public int RoomId { get; set; }         // Id phòng chiếu mà ghế thuộc về
        public int SeatTypeId { get; set; }     // Loại ghế mới
    }
}
