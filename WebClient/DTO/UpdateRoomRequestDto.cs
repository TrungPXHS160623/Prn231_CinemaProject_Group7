namespace WebClient.DTO
{
    public class UpdateRoomRequestDto
    {
        public int TheaterId { get; set; }
        public string Name { get; set; } = null!;
        public int SeatCapacity { get; set; }
        public bool? IsActive { get; set; }
    }
}
