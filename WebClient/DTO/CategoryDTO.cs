using WebClient.Models;
namespace WebClient.DTO
{
    public class CategoryDTO
    {
        public int CategoryId { get; set; }
        public string? CategoryName { get; set; }
        public string? Description { get; set; }
        public bool? IsActive { get; set; } = true;
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public List<MovieDTO>? Movies { get; set; }

    }
}
