using System;
using System.Collections.Generic;

namespace WebClient.Models
{
    public partial class OrderDetail
    {
        public int OrderDetailId { get; set; }
        public int OrderId { get; set; }
        public int ShowtimeId { get; set; }
        public int SeatId { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }

        public virtual Order Order { get; set; } = null!;
        public virtual Seat Seat { get; set; } = null!;
        public virtual Showtime Showtime { get; set; } = null!;
    }
}
