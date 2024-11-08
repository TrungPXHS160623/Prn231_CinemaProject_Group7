using System;
using System.Collections.Generic;

namespace WebClient.Models
{
    public partial class Showtime
    {
        public Showtime()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int ShowtimeId { get; set; }
        public int MovieId { get; set; }
        public int RoomId { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public bool? IsActive { get; set; }
        public int TheaterId { get; set; }
        public virtual Movie Movie { get; set; } = null!;
        public virtual Room Room { get; set; } = null!;
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
