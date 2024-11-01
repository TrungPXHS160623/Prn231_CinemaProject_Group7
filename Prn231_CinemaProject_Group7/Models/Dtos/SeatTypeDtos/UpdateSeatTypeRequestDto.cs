namespace Prn231_CinemaProject_Group7.Models.Dtos.SeatTypeDtos
{
    public class UpdateSeatTypeRequestDto
    {
        public int SeatTypeId { get; set; }
        public string TypeName { get; set; } = null!;
        public string? Description { get; set; }
        public decimal? Price { get; set; }
        public bool? IsActive { get; set; }
    }
}
