namespace Prn231_CinemaProject_Group7.Models.Dtos.RoomDtos
{
    public class UpdateRoomRequestDto
    {
        public int TheaterId { get; set; }
        public string Name { get; set; } = null!;
        public int SeatCapacity { get; set; }
        public bool? IsActive { get; set; }
    }
}
