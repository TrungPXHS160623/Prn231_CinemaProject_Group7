namespace Prn231_CinemaProject_Group7.DTO
{
	public class ConcessionDTO
	{
		public string ProductName { get; set; } = null!;
		public string? Description { get; set; }
		public decimal Price { get; set; }
		public int StockQuantity { get; set; }
		public int? CategoryId { get; set; }
		public bool? IsActive { get; set; }
	}
}
