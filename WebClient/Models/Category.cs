using System;
using System.Collections.Generic;

namespace WebClient.Models
{
    public partial class Category
    {
        public Category()
        {
            Movies = new HashSet<Movie>();
        }

        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = null!;
        public string? Description { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Movie> Movies { get; set; }
    }
}
