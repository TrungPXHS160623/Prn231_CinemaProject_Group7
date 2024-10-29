using System;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Models
{
    public partial class User
    {
        public User()
        {
            MovieReviews = new HashSet<MovieReview>();
            Orders = new HashSet<Order>();
        }

        public int CustomerId { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string? Phone { get; set; }
        public string? City { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public bool? IsActive { get; set; }
        public int? RoleId { get; set; }

        public virtual ICollection<MovieReview> MovieReviews { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
