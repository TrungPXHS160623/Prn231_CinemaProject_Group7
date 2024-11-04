using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Models.Dtos.SeatTypeDtos;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SeatTypeController : ControllerBase
    {
        private readonly ISeatTypeRepository seatTypeRepository;
        private readonly IMapper mapper;

        public SeatTypeController(ISeatTypeRepository seatTypeRepository, IMapper mapper)
        {
            this.seatTypeRepository = seatTypeRepository;
            this.mapper = mapper;
        }

        // Tạo loại ghế mới
        [HttpPost]
        public async Task<IActionResult> CreateSeatType([FromBody] AddSeatTypeRequestDto addSeatTypeRequestDto)
        {
            // Kiểm tra tính hợp lệ của dữ liệu đầu vào
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState); // Trả về mã 400 nếu dữ liệu không hợp lệ
            }
            var seatTypeDomainModel = mapper.Map<SeatType>(addSeatTypeRequestDto);
            var createdSeatType = await seatTypeRepository.AddSeatType(seatTypeDomainModel);

            return Ok(mapper.Map<SeatTypeDto>(createdSeatType));
        }

        // Cập nhật loại ghế
        [HttpPut]
        public async Task<IActionResult> UpdateSeatType([FromBody] UpdateSeatTypeRequestDto updateSeatTypeRequestDto)
        {

            var seatTypeDomainModel = mapper.Map<SeatType>(updateSeatTypeRequestDto);

            var updatedSeatType = await seatTypeRepository.UpdateSeatType(seatTypeDomainModel);
            if (updatedSeatType == null)
                return NotFound();

            return Ok(mapper.Map<SeatTypeDto>(updatedSeatType));
        }

        // Xóa loại ghế theo ID
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSeatType(int id)
        {
            var deletedSeatType = await seatTypeRepository.DeleteSeatType(id);
            if (deletedSeatType == null)
                return NotFound();

            return Ok(mapper.Map<SeatTypeDto>(deletedSeatType));
        }

        // Lấy tất cả các loại ghế
        [HttpGet]
        public async Task<IActionResult> GetAllSeatTypes()
        {
            var seatTypes = await seatTypeRepository.GetAllSeatType();
            return Ok(mapper.Map<List<SeatTypeDto>>(seatTypes));
        }

        // Lấy loại ghế theo ID
        [HttpGet("{id}")]
        public async Task<IActionResult> GetSeatTypeById(int id)
        {
            var seatType = await seatTypeRepository.GetSeatTypeById(id);
            if (seatType == null)
                return NotFound();

            return Ok(mapper.Map<SeatTypeDto>(seatType));
        }

        // Tìm kiếm loại ghế theo tên
        [HttpGet("search")]
        public async Task<IActionResult> SearchSeatType([FromQuery] string typeName)
        {
            var seatTypes = await seatTypeRepository.SearchSeatType(typeName);
            return Ok(mapper.Map<List<SeatTypeDto>>(seatTypes));
        }

        // Lấy tất cả các loại ghế đang hoạt động
        [HttpGet("active")]
        public async Task<IActionResult> GetActiveSeatTypes()
        {
            var activeSeatTypes = await seatTypeRepository.GetActiveSeatTypes();
            return Ok(mapper.Map<List<SeatTypeDto>>(activeSeatTypes));
        }

        [HttpPut("{Sid}")]
        public async Task<IActionResult> DeactiveSeatType(int Sid)
        {
            var deactiveSeatType = await seatTypeRepository.DeActiveASeatType(Sid);
            if (deactiveSeatType == null)
                return NotFound();

            return Ok(mapper.Map<SeatTypeDto>(deactiveSeatType));
        }
        

    }
}
