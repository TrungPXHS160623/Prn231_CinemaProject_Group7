using System;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Models
{
    public partial class Concession
    {
        public Concession()
        {
            OrderConcessions = new HashSet<OrderConcession>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; } = null!;
        public string? Description { get; set; }
        public decimal Price { get; set; }
        public int StockQuantity { get; set; }
        public int? CategoryId { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }

        public virtual ConcessionsCategory? Category { get; set; }
        public virtual ICollection<OrderConcession> OrderConcessions { get; set; }
    }
}
