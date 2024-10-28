using System;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Models
{
    public partial class SeatType
    {
        public SeatType()
        {
            Seats = new HashSet<Seat>();
        }

        public int SeatTypeId { get; set; }
        public string TypeName { get; set; } = null!;
        public string? Description { get; set; }
        public decimal? Price { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Seat> Seats { get; set; }
    }
}
