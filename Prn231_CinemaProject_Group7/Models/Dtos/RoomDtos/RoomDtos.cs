namespace Prn231_CinemaProject_Group7.Models.Dtos.RoomDtos
{
    public class RoomDtos
    {
        public int RoomId { get; set; }
        public int TheaterId { get; set; }
        public string Name { get; set; } = null!;
        public int SeatCapacity { get; set; }
        public bool? IsActive { get; set; }
    }
}
