using System;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Models
{
    public partial class CouponUser
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
