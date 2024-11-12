namespace WebClient.DTO
{
    public class RoomDto
    {
        public int RoomId { get; set; }
        public int TheaterId { get; set; }
        public string Name { get; set; } = null!;
        public int SeatCapacity { get; set; }
        public bool IsActive { get; set; }
        public int? RoomUtilazation { get; set; }
        public string TheaterName { get; set; } // Thêm TheaterName
    }
}
