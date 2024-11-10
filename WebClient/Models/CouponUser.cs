namespace WebClient.Models
{
    public class CouponUser
    {
        public int CouponId { get; set; }
        public int UserId { get; set; }
        public DateTime? CreateAt { get; set; }
        public DateTime? UpdateAt { get; set; }
        public bool? IsActive { get; set; }
        public virtual Coupon Coupon { get; set; } = null!;
        public virtual User User { get; set; } = null!;

    }
}
