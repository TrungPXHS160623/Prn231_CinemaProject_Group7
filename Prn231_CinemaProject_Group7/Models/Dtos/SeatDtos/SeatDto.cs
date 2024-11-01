namespace Prn231_CinemaProject_Group7.Models.Dtos.SeatDtos
{
    public class SeatDto
    {
        public int SeatId { get; set; }
        public int RoomId { get; set; }
        public int SeatTypeId { get; set; }
        public string SeatNumber { get; set; } = null!;
        public string RowName { get; set; } = null!;
        public bool? IsAvailable { get; set; }
        public bool? IsActive { get; set; }
    }
}
