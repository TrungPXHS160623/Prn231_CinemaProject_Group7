using System;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Models
{
    public partial class ConcessionsCategory
    {
        public ConcessionsCategory()
        {
            Concessions = new HashSet<Concession>();
        }

        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = null!;
        public string? Description { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Concession> Concessions { get; set; }
    }
}
