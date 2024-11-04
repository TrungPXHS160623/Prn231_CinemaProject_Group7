using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models.Dtos.RoomDtos;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomController : ControllerBase
    {
        private readonly IRoomRepository roomRepository;
        private readonly IMapper mapper;

        public RoomController(IRoomRepository roomRepository,IMapper mapper)
        {
            this.roomRepository = roomRepository;
            this.mapper = mapper;
        }
        // Lấy danh sách tất cả các phòng
        [HttpGet]
        public async Task<IActionResult> GetAllRooms()
        {
            var rooms = await roomRepository.GetAllRooms();
            var roomDtos = mapper.Map<List<RoomDtos>>(rooms);
            return Ok(roomDtos);
        }

        // Lấy thông tin phòng theo ID
        [HttpGet("{id}")]
        public async Task<IActionResult> GetRoomById(int id)
        {
            var room = await roomRepository.GetRoomById(id);
            if (room == null)
            {
                return NotFound();
            }
            var roomDto = mapper.Map<RoomDtos>(room);
            return Ok(roomDto);
        }

        // Thêm một phòng mới
        [HttpPost]
        public async Task<IActionResult> AddRoom([FromBody] AddRoomRequestDto addRoomRequest)
        {
            var room = mapper.Map<Room>(addRoomRequest);
            var addedRoom = await roomRepository.AddRoom(room);
            var roomDto = mapper.Map<RoomDtos>(addedRoom);
            return CreatedAtAction(nameof(GetRoomById), new { id = roomDto.RoomId }, roomDto);
        }

        // Cập nhật thông tin phòng
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateRoom([FromBody] UpdateRoomRequestDto updateRoomRequest)
        {

            var room = mapper.Map<Room>(updateRoomRequest);
            var updatedRoom = await roomRepository.UpdateRoom(room);
            if (updatedRoom == null)
            {
                return NotFound();
            }

            var roomDto = mapper.Map<RoomDtos>(updatedRoom);
            return Ok(roomDto);
        }

        // Xóa phòng theo ID
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteRoom(int id)
        {
            var deleted = await roomRepository.DeleteRoom(id);
            if (!deleted)
            {
                return NotFound();
            }
            return NoContent();
        }

        // Lấy danh sách phòng theo rạp chiếu (TheaterId)
        [HttpGet("theater/{theaterId}")]
        public async Task<IActionResult> GetRoomsByTheaterId(int theaterId)
        {
            var rooms = await roomRepository.GetRoomsByTheaterId(theaterId);
            var roomDtos = mapper.Map<List<RoomDtos>>(rooms);
            return Ok(roomDtos);
        }

        // Lấy danh sách các phòng đang hoạt động
        [HttpGet("active")]
        public async Task<IActionResult> GetActiveRooms()
        {
            var rooms = await roomRepository.GetActiveRooms();
            var roomDtos = mapper.Map<List<RoomDtos>>(rooms);
            return Ok(roomDtos);
        }

        // Vô hiệu hóa phòng
        [HttpPut("deactivate/{id}")]
        public async Task<IActionResult> DeactivateRoom(int id)
        {
            var deactivatedRoom = await roomRepository.DeactivateRoom(id);
            if (deactivatedRoom == null)
            {
                return NotFound();
            }

            var roomDto = mapper.Map<RoomDtos>(deactivatedRoom);
            return Ok(roomDto);
        }

        // Kiểm tra phòng có tồn tại theo ID
        [HttpGet("exists/{id}")]
        public async Task<IActionResult> RoomExists(int id)
        {
            var exists = await roomRepository.RoomExists(id);
            return Ok(new { exists });
        }

        // Kiểm tra xem phòng có đủ sức chứa cho một số lượng ghế cụ thể
        [HttpGet("{roomId}/capacity/{requiredSeats}")]
        public async Task<IActionResult> HasEnoughCapacity(int roomId, int requiredSeats)
        {
            var hasCapacity = await roomRepository.HasEnoughCapacity(roomId, requiredSeats);
            return Ok(new { hasCapacity });
        }
    }
}
