using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.DTO
{
    public class MovieDTO
    {
        public int MovieId { get; set; }
        public string Title { get; set; } = null!;
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

        //MovieDTO(int movieId, string title, string? description, int duration, DateTime? releaseDate, string? language, string? director, string? cast, string? ageRating, string? trailerUrl, string? posterUrl, bool? isActive, List<CategoryDTO> categories)
        //{
        //    MovieId = movieId;
        //    Title = title;
        //    Description = description;
        //    Duration = duration;
        //    ReleaseDate = releaseDate;
        //    Language = language;
        //    Director = director;
        //    Cast = cast;
        //    AgeRating = ageRating;
        //    TrailerUrl = trailerUrl;
        //    PosterUrl = posterUrl;
        //    IsActive = isActive;
        //    Categories = categories;
        //}
    }

}
