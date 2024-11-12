namespace WebClient.DTO
{
    public class TheaterDto
    {
        public int TheaterId { get; set; }
        public string Name { get; set; } = null!;
        public string Address { get; set; } = null!;
        public string? Phone { get; set; }
        public string? OpeningHour { get; set; }
        public string? ClosingHour { get; set; }
        public bool? IsActive { get; set; }
    }
}
