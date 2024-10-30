using System;
using System.Collections.Generic;

namespace WebClient.Models
{
    public partial class GiftCard
    {
        public GiftCard()
        {
            Orders = new HashSet<Order>();
        }

        public int GiftCardId { get; set; }
        public string Code { get; set; } = null!;
        public decimal Balance { get; set; }
        public DateTime? ExpirationDate { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
