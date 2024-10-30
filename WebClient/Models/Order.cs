using System;
using System.Collections.Generic;

namespace WebClient.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderConcessions = new HashSet<OrderConcession>();
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int OrderId { get; set; }
        public int CustomerId { get; set; }
        public DateTime? OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
        public bool? IsPaid { get; set; }
        public string PaymentMethod { get; set; } = null!;
        public int StatusId { get; set; }
        public int? CouponId { get; set; }
        public int? GiftCardId { get; set; }

        public virtual Coupon? Coupon { get; set; }
        public virtual User Customer { get; set; } = null!;
        public virtual GiftCard? GiftCard { get; set; }
        public virtual OrderStatus Status { get; set; } = null!;
        public virtual ICollection<OrderConcession> OrderConcessions { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
