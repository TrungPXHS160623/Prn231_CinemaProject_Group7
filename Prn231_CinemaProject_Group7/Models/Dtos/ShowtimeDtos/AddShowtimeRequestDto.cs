namespace Prn231_CinemaProject_Group7.Models.Dtos.ShowtimeDtos
{
    public class AddShowtimeRequestDto
    {
        public int MovieId { get; set; }
        public int RoomId { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public bool? IsActive { get; set; }
    }
}
