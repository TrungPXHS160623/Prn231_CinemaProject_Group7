namespace Prn231_CinemaProject_Group7.DTO
{
	public class CouponDTO
	{
		public string Code { get; set; } = null!;
		public decimal Discount { get; set; }
		public DateTime? ExpirationDate { get; set; }
		public bool? IsActive { get; set; }
	}
}
