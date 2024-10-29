using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.DTO
{
    public class OrderDTO
    {
        public int CustomerId { get; set; }
        public DateTime? OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
        public bool? IsPaid { get; set; }
        public string PaymentMethod { get; set; } = null!;
        public int StatusId { get; set; }
        public int? CouponId { get; set; }
        public int? GiftCardId { get; set; }
        public virtual ICollection<OrderConcession> OrderConcessions { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
