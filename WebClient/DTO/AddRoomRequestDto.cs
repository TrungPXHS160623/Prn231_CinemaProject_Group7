namespace WebClient.DTO
{
    public class AddRoomRequestDto
    {
        public string Name { get; set; }
        public int SeatCapacity { get; set; }
        public int TheaterId { get; set; }
        public bool IsActive { get; set; }
    }
}
