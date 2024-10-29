using System;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Models
{
    public partial class MovieReview
    {
        public int ReviewId { get; set; }
        public int MovieId { get; set; }
        public int CustomerId { get; set; }
        public int Rating { get; set; }
        public string? ReviewText { get; set; }
        public DateTime? ReviewDate { get; set; }

        public virtual User Customer { get; set; } = null!;
        public virtual Movie Movie { get; set; } = null!;
    }
}
