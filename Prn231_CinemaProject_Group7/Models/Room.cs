using System;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Models
{
    public partial class Room
    {
        public Room()
        {
            Seats = new HashSet<Seat>();
            Showtimes = new HashSet<Showtime>();
        }

        public int RoomId { get; set; }
        public int TheaterId { get; set; }
        public string Name { get; set; } = null!;
        public int SeatCapacity { get; set; }
        public bool? IsActive { get; set; }

        public virtual Theater Theater { get; set; } = null!;
        public virtual ICollection<Seat> Seats { get; set; }
        public virtual ICollection<Showtime> Showtimes { get; set; }
    }
}
