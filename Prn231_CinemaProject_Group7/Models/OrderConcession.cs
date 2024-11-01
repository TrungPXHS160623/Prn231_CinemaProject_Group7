using System;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Models
{
    public partial class OrderConcession
    {
        public int OrderConcessionId { get; set; }
        public int OrderId { get; set; }
        public int ConcessionId { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public virtual Concession Concession { get; set; } = null!;
        public virtual Order Order { get; set; } = null!;
    }
}
