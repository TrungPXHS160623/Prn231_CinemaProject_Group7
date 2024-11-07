using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Models.Dtos.ShowtimeDtos;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShowtimeController : ControllerBase
    {
        private readonly IShowtimeRepository showtimeRepository;
        private readonly IMapper mapper;

        public ShowtimeController(IShowtimeRepository showtimeRepository, IMapper mapper)
        {
            this.showtimeRepository = showtimeRepository;
            this.mapper = mapper;
        }

        // 1. Add a new showtime
        [HttpPost]
        public async Task<IActionResult> AddShowtime([FromBody] AddShowtimeRequestDto requestDto)
        {
            var showtime = mapper.Map<Showtime>(requestDto);
            var addedShowtime = await showtimeRepository.AddShowtime(showtime);
            return CreatedAtAction(nameof(GetShowtimeById), new { showtimeId = addedShowtime.ShowtimeId }, mapper.Map<ShowtimeDto>(addedShowtime));
        }

        // 2. Update showtime information
        [HttpPut("{showtimeId}")]
        public async Task<IActionResult> UpdateShowtime(int showtimeId, [FromBody] UpdateShowtimeRequest updateDto)
        {
            if (!await showtimeRepository.ShowtimeExists(showtimeId))
                return NotFound();

            var showtime = mapper.Map<Showtime>(updateDto);
            showtime.ShowtimeId = showtimeId;
            var updatedShowtime = await showtimeRepository.UpdateShowtime(showtime);
            return Ok(mapper.Map<ShowtimeDto>(updatedShowtime));
        }

        // 3. Delete showtime by ID
        [HttpDelete("{showtimeId}")]
        public async Task<IActionResult> DeleteShowtime(int showtimeId)
        {
            var success = await showtimeRepository.DeleteShowtime(showtimeId);
            if (!success)
                return NotFound();

            return NoContent();
        }

        // 4. Deactivate showtime by ID
        [HttpPut("{showtimeId}/deactivate")]
        public async Task<IActionResult> DeactivateShowtime(int showtimeId)
        {
            var deactivatedShowtime = await showtimeRepository.DeactivateShowtime(showtimeId);
            if (deactivatedShowtime == null)
                return NotFound();

            return Ok(mapper.Map<ShowtimeDto>(deactivatedShowtime));
        }

        // 5. Get showtime by ID
        [HttpGet("{showtimeId}")]
        public async Task<IActionResult> GetShowtimeById(int showtimeId)
        {
            var showtime = await showtimeRepository.GetShowtimeById(showtimeId);
            if (showtime == null)
                return NotFound();

            return Ok(mapper.Map<ShowtimeDto>(showtime));
        }

        // 6. Get all showtimes
        [HttpGet]
        public async Task<IActionResult> GetAllShowtimes()
        {
            var showtimes = await showtimeRepository.GetAllShowtimes();
            return Ok(mapper.Map<List<ShowtimeDto>>(showtimes));
        }

        // 7. Get active showtimes
        [HttpGet("active")]
        public async Task<IActionResult> GetActiveShowtimes()
        {
            var showtimes = await showtimeRepository.GetActiveShowtimes();
            return Ok(mapper.Map<List<ShowtimeDto>>(showtimes));
        }

        // 8. Get showtimes by room ID
        [HttpGet("room/{roomId}")]
        public async Task<IActionResult> GetShowtimesByRoomId(int roomId)
        {
            var showtimes = await showtimeRepository.GetShowtimesByRoomId(roomId);
            return Ok(mapper.Map<List<ShowtimeDto>>(showtimes));
        }

        // 9. Get showtimes by movie ID
        [HttpGet("movie/{movieId}")]
        public async Task<IActionResult> GetShowtimesByMovieId(int movieId)
        {
            var showtimes = await showtimeRepository.GetShowtimesByMovieId(movieId);
            return Ok(mapper.Map<List<ShowtimeDto>>(showtimes));
        }
        [HttpGet("GetShowTimeByMovieTheater/{movieId}/{theaterId}")]
        public async Task<IActionResult> GetShowTimeByMovieTheater(int movieId, int theaterId)
        {
            var showtimes = await showtimeRepository.GetShowTimeByMovieTheater(movieId,theaterId);
            return Ok(mapper.Map<List<ShowtimeDto>>(showtimes));
        }

        // 10. Check if a showtime is available
        [HttpGet("availability")]
        public async Task<IActionResult> IsShowtimeAvailable(int roomId, DateTime startTime, DateTime endTime)
        {
            var isAvailable = await showtimeRepository.IsShowtimeAvailable(roomId, startTime, endTime);
            return Ok(isAvailable);
        }

        // 11. Check if a showtime exists by ID
        [HttpGet("{showtimeId}/exists")]
        public async Task<IActionResult> ShowtimeExists(int showtimeId)
        {
            var exists = await showtimeRepository.ShowtimeExists(showtimeId);
            return Ok(exists);
        }

        // 12. Get showtimes by date
        [HttpGet("date/{date}")]
        public async Task<IActionResult> GetShowtimesByDate(DateTime date)
        {
            var showtimes = await showtimeRepository.GetShowtimesByDate(date);
            return Ok(mapper.Map<List<ShowtimeDto>>(showtimes));
        }
    }
}
