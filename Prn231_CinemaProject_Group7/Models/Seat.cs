using System;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Models
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
        public string RowName { get; set; } = null!;
        public bool? IsAvailable { get; set; }
        public bool? IsActive { get; set; }

        public virtual Room Room { get; set; } = null!;
        public virtual SeatType SeatType { get; set; } = null!;
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
