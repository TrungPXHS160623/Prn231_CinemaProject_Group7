namespace WebClient.DTO
{
    public class SeatTypeDto
    {
        public int SeatTypeId { get; set; }
        public string TypeName { get; set; } = null!;
        public string? Description { get; set; }
        public decimal? Price { get; set; }
        public bool? IsActive { get; set; }
    }
}
