using System;
using System.Collections.Generic;

namespace WebClient.Models
{
    public partial class Seat
    {
        public Seat()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int SeatId { get; set; }
        public int RoomId { get; set; }
        public int SeatTypeId { get; set; }
        public string SeatNumber { get; set; } = null!;
        public string Row { get; set; } = null!;
        public bool? IsAvailable { get; set; }

        public virtual Room Room { get; set; } = null!;
        public virtual SeatType SeatType { get; set; } = null!;
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
