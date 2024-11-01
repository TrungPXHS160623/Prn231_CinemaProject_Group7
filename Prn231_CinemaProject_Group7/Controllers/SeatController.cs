using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models.Dtos.SeatDtos;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SeatController : ControllerBase
    {
        private readonly ISeatRepository seatRepository;
        private readonly IMapper mapper;

        public SeatController(ISeatRepository seatRepository,IMapper mapper)
        {
            this.seatRepository = seatRepository;
            this.mapper = mapper;
        }
        // Tạo mới ghế
        [HttpPost]
        public async Task<IActionResult> CreateSeat([FromBody] AddSeatRequestDto addSeatRequestDto)
        {
            var seatDomainModel = mapper.Map<Seat>(addSeatRequestDto);
            var createdSeat = await seatRepository.AddSeat(seatDomainModel);
            return Ok(mapper.Map<SeatDto>(createdSeat));
        }

        // Cập nhật ghế
        [HttpPut]
        public async Task<IActionResult> UpdateSeat([FromBody] UpdateSeatRequestDto updateSeatRequestDto)
        {
            var seatDomainModel = mapper.Map<Seat>(updateSeatRequestDto);
            var updatedSeat = await seatRepository.UpdateSeat(seatDomainModel);
            if (updatedSeat == null)
                return NotFound();

            return Ok(mapper.Map<SeatDto>(updatedSeat));
        }

        // Vô hiệu hóa ghế
        [HttpPut("{seatId}/deactivate")]
        public async Task<IActionResult> DeactivateSeat(int seatId)
        {
            var deactivatedSeat = await seatRepository.DeactivateSeat(seatId);
            if (deactivatedSeat == null)
                return NotFound();

            return Ok(mapper.Map<SeatDto>(deactivatedSeat));
        }

        // Xóa ghế theo ID
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSeat(int id)
        {
            var seat = await seatRepository.GetSeatById(id);
            if (seat == null)
                return NotFound();

            var deleted = await seatRepository.DeleteSeat(seat);
            return deleted ? Ok() : StatusCode(StatusCodes.Status500InternalServerError);
        }

        // Lấy tất cả ghế theo Room ID
        [HttpGet("room/{roomId}")]
        public async Task<IActionResult> GetSeatsByRoomId(int roomId)
        {
            var seats = await seatRepository.GetSeatByRoomId(roomId);
            return Ok(mapper.Map<List<SeatDto>>(seats));
        }

        // Lấy tất cả ghế đang hoạt động theo Room ID
        [HttpGet("room/{roomId}/active")]
        public async Task<IActionResult> GetActiveSeatsByRoomId(int roomId)
        {
            var seats = await seatRepository.GetActiveSeatsByRoomId(roomId);
            return Ok(mapper.Map<List<SeatDto>>(seats));
        }

        // Lấy ghế theo ID
        [HttpGet("{id}")]
        public async Task<IActionResult> GetSeatById(int id)
        {
            var seat = await seatRepository.GetSeatById(id);
            if (seat == null)
                return NotFound();

            return Ok(mapper.Map<SeatDto>(seat));
        }

        // Kiểm tra ghế có sẵn
        [HttpGet("{seatId}/availability")]
        public async Task<IActionResult> IsSeatAvailable(int seatId)
        {
            var isAvailable = await seatRepository.IsSeatAvailable(seatId);
            return Ok(isAvailable);
        }

        // Đặt ghế
        [HttpPut("{seatId}/reserve")]
        public async Task<IActionResult> ReserveSeat(int seatId)
        {
            var reservedSeat = await seatRepository.ReserveSeat(seatId);
            if (reservedSeat == null)
                return NotFound();

            return Ok(mapper.Map<SeatDto>(reservedSeat));
        }

        // Bỏ đặt ghế
        [HttpPut("{seatId}/unreserve")]
        public async Task<IActionResult> UnreserveSeat(int seatId)
        {
            var unreservedSeat = await seatRepository.UnreserveSeat(seatId);
            if (unreservedSeat == null)
                return NotFound();

            return Ok(mapper.Map<SeatDto>(unreservedSeat));
        }

        // Tìm kiếm ghế theo loại ghế trong một phòng
        [HttpGet("room/{roomId}/seatType/{seatTypeId}")]
        public async Task<IActionResult> SearchSeatsByType(int roomId, int seatTypeId)
        {
            var seats = await seatRepository.SearchSeatsByType(roomId, seatTypeId);
            return Ok(mapper.Map<List<SeatDto>>(seats));
        }
    }
}
