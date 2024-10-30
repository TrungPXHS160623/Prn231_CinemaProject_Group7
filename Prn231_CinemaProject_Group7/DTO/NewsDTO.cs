using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.DTO
{
    public class NewsDTO
    {
        public string Title { get; set; } = null!;
        public string Content { get; set; } = null!;
        public string? Author { get; set; }
        public DateTime? PublishedDate { get; set; }
        public string? ImageUrl { get; set; }
        public bool? IsActive { get; set; }
    }
}
