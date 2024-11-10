using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models.Dtos.TheaterDtos;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TheaterController : ControllerBase
    {
        private readonly ITheaterRepository theaterRepository;
        private readonly IMapper mapper;

        public TheaterController(ITheaterRepository theaterRepository, IMapper mapper)
        {
            this.theaterRepository = theaterRepository;
            this.mapper = mapper;
        }
        // 1. Thêm một rạp chiếu mới
        [HttpPost]
        public async Task<IActionResult> AddTheater([FromBody]AddTheaterRequestDto theaterDto)
        {
            var theater = mapper.Map<Theater>(theaterDto);
            var addedTheater = await theaterRepository.AddTheater(theater);
            return CreatedAtAction(nameof(GetTheaterById), new { theaterId = addedTheater.TheaterId }, theaterDto);
        }

        // 2. Cập nhật thông tin rạp chiếu
        [HttpPut("{theaterId}")]
        public async Task<IActionResult> UpdateTheater([FromBody] UpdateTheaterRequestDto theaterDto)
        {
            var theater = mapper.Map<Theater>(theaterDto);
            var updatedTheater = await theaterRepository.UpdateTheater(theater);

            if (updatedTheater == null)
            {
                return NotFound();
            }

            return NoContent();
        }

        // 3. Xóa rạp chiếu theo ID
        [HttpDelete("{theaterId}")]
        public async Task<IActionResult> DeleteTheater(int theaterId)
        {
            var result = await theaterRepository.DeleteTheater(theaterId);
            if (!result)
            {
                return NotFound();
            }

            return NoContent();
        }

        // 4. Lấy thông tin rạp chiếu theo ID
        [HttpGet("{theaterId}")]
        public async Task<IActionResult> GetTheaterById(int theaterId)
        {
            var theater = await theaterRepository.GetTheaterById(theaterId);
            if (theater == null)
            {
                return NotFound();
            }

            var theaterDto = mapper.Map<TheaterDtocs>(theater);
            return Ok(theaterDto);
        }

        // 5. Lấy danh sách tất cả các rạp chiếu
        [HttpGet]
        public async Task<IActionResult> GetAllTheaters()
        {
            var theaters = await theaterRepository.GetAllTheaters();
            var theaterDtos = mapper.Map<List<TheaterDtocs>>(theaters);
            return Ok(theaterDtos);
        }

        // 6. Lấy danh sách các rạp chiếu đang hoạt động
        [HttpGet("active")]
        public async Task<IActionResult> GetActiveTheaters()
        {
            var theaters = await theaterRepository.GetActiveTheaters();
            var theaterDtos = mapper.Map<List<TheaterDtocs>>(theaters);
            return Ok(theaterDtos);
        }

        // 7. Lấy danh sách phòng chiếu theo TheaterId
        [HttpGet("{theaterId}/rooms")]
        public async Task<IActionResult> GetRoomsByTheaterId(int theaterId)
        {
            var rooms = await theaterRepository.GetRoomsByTheaterId(theaterId);
            return Ok(rooms); // Bạn có thể tạo DTO cho Room nếu cần thiết
        }

        // 8. Kiểm tra xem rạp chiếu có tồn tại không theo ID
        [HttpGet("exists/{theaterId}")]
        public async Task<IActionResult> TheaterExists(int theaterId)
        {
            var exists = await theaterRepository.TheaterExists(theaterId);
            return Ok(new { exists });
        }
        [HttpGet("GetTheaterByMovieId/{movieId}")]
        public async Task<List<Theater>> GetTheaterByMovieId(int movieId)
        {
            var theaters = await theaterRepository.GetTheaterByMovieId(movieId);
            return theaters;
        }
    }

}
