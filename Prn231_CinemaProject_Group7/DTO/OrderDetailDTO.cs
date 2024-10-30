namespace Prn231_CinemaProject_Group7.DTO
{
    public class OrderDetailDTO
    {
        public int OrderId { get; set; }
        public int ShowtimeId { get; set; }
        public int SeatId { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }
}
