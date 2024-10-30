using System;
using System.Collections.Generic;

namespace WebClient.Models
{
    public partial class Theater
    {
        public Theater()
        {
            Rooms = new HashSet<Room>();
        }

        public int TheaterId { get; set; }
        public string Name { get; set; } = null!;
        public string Address { get; set; } = null!;
        public string? Phone { get; set; }
        public string? OpeningHour { get; set; }
        public string? ClosingHour { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Room> Rooms { get; set; }
    }
}
