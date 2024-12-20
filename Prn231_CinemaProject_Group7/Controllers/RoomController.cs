﻿using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models.Dtos.RoomDtos;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Repository;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomController : ControllerBase
    {
        private readonly IRoomRepository roomRepository;
        private readonly ITheaterRepository theaterRepository;
        private readonly IMapper mapper;

        public RoomController(IRoomRepository roomRepository,ITheaterRepository theaterRepository,IMapper mapper)
        {
            this.roomRepository = roomRepository;
            this.theaterRepository = theaterRepository;
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
        public async Task<IActionResult> UpdateRoom(int id, [FromBody] UpdateRoomRequestDto updateRoomRequest)
        {
            // Chuyển đổi DTO thành model Room và gán thêm RoomId
            var room = mapper.Map<Room>(updateRoomRequest);
            room.RoomId = id; // Thêm RoomId từ URL vào đối tượng room

            // Cập nhật phòng trong database
            var updatedRoom = await roomRepository.UpdateRoom(room);
            if (updatedRoom == null)
            {
                return NotFound(); // Trả về NotFound nếu không tìm thấy phòng
            }

            // Chuyển đổi Room thành RoomDtos và trả về kết quả
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

    }
}
