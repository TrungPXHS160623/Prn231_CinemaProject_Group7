using WebClient.Models;
namespace WebClient.DTO
{
    public class MovieDTO
    {
        public int? MovieId { get; set; }
        public string? Title { get; set; } = null!;
        public string? Description { get; set; }
        public int Duration { get; set; }
        public DateTime? ReleaseDate { get; set; }
        public string? Language { get; set; }
        public string? Director { get; set; }
        public string? Cast { get; set; }
        public string? AgeRating { get; set; }
        public string? TrailerUrl { get; set; }
        public string? PosterUrl { get; set; }
        public bool? IsActive { get; set; }
        public List<CategoryDTO>? Categories { get; set; }

    }
}
