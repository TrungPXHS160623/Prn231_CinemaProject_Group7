namespace Prn231_CinemaProject_Group7.DTO
{
	public class GiftCardDTO
	{
		public string Code { get; set; } = null!;
		public decimal Balance { get; set; }
		public DateTime? ExpirationDate { get; set; }
		public bool? IsActive { get; set; }
	}
}
