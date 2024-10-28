using System;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Models
{
    public partial class Movie
    {
        public Movie()
        {
            MovieReviews = new HashSet<MovieReview>();
            Showtimes = new HashSet<Showtime>();
            Categories = new HashSet<Category>();
        }

        public int MovieId { get; set; }
        public string Title { get; set; } = null!;
        public string? Description { get; set; }
        public int Duration { get; set; }
        public DateTime? ReleaseDate { get; set; }
        public string? Language { get; set; }
        public string? Director { get; set; }
        public string? Cast { get; set; }
        public string? AgeRating { get; set; }
        public string? TrailerUrl { get; set; }
        public string? PosterUrl { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<MovieReview> MovieReviews { get; set; }
        public virtual ICollection<Showtime> Showtimes { get; set; }

        public virtual ICollection<Category> Categories { get; set; }
    }
}
