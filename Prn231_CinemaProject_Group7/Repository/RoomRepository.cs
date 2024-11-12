using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Models.Dtos.RoomDtos;
using System.ComponentModel.Design;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class RoomRepository : IRoomRepository
    {
        private readonly Prn231_Project_FinalContext dbContext;

        public RoomRepository(Prn231_Project_FinalContext _dbContext)
        {
            dbContext = _dbContext;
        }
        public async Task<Room> AddRoom(Room room)
        {
            // Kiểm tra TheaterId có tồn tại không
            var theaterExists = await dbContext.Theaters.AnyAsync(t => t.TheaterId  == room.TheaterId);
            if (!theaterExists)
            {
                throw new ArgumentException($"TheaterId {room.RoomId} does not exist.");
            }
            await dbContext.Rooms.AddAsync(room);
            await dbContext.SaveChangesAsync();
            return room;

        }

        public async Task<Room?> DeactivateRoom(int roomId)
        {
            var room = await dbContext.Rooms.FirstOrDefaultAsync(r => r.RoomId == roomId);
            if (room != null)
            {
                room.IsActive = false;
                await dbContext.SaveChangesAsync();
            }
            return room;
        }

        public async Task<bool> DeleteRoom(int roomId)
        {
            var room = await dbContext.Rooms.FirstOrDefaultAsync(r => r.RoomId == roomId);
            if (room != null)
            {
                dbContext.Rooms.Remove(room);
                await dbContext.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<List<RoomDtos>> GetActiveRooms()
        {
            return await dbContext.Rooms
                .Where(r => r.IsActive == true)
                .Include(r => r.Showtimes)
                .ThenInclude(st => st.OrderDetails)
                .Select(r => new RoomDtos
                {
                    RoomId = r.RoomId,
                    IsActive = r.IsActive,
                    Name = r.Name,
                    SeatCapacity = r.SeatCapacity,
                    TheaterId = r.TheaterId,
                    RoomUtilazation = r.Showtimes.SelectMany(st => st.OrderDetails).Count()
                })
                .ToListAsync();
        }

        public async Task<List<Room>> GetAllRooms()
        {
            return await dbContext.Rooms
                .Include(r => r.Theater)
                .ToListAsync();
        }

        public async Task<Room?> GetRoomById(int roomId)
        {
            return await dbContext.Rooms
                .Include(r => r.Theater)
                .SingleOrDefaultAsync(r => r.RoomId == roomId);
        }

        public async Task<List<Room>> GetRoomsByTheaterId(int theaterId)
        {
            return await dbContext.Rooms
                .Where(r => r.TheaterId == theaterId)
                .ToListAsync();
        }

        public async Task<bool> HasEnoughCapacity(int roomId, int requiredSeats)
        {
            var room = await dbContext.Rooms.FirstOrDefaultAsync(r => r.RoomId == roomId);
            if (room == null)
            {
                throw new KeyNotFoundException($"Room with ID {roomId} not found.");
            }
            return room.SeatCapacity >= requiredSeats;
        }

        public async Task<bool> RoomExists(int roomId)
        {
            return await dbContext.Rooms.AnyAsync(r => r.RoomId == roomId);
        }

        public async Task<Room?> UpdateRoom(Room room)
        {
            // Kiểm tra TheaterId có tồn tại không
            var theaterExists = await dbContext.Theaters.AnyAsync(t => t.TheaterId == room.TheaterId);
            if (!theaterExists)
            {
                throw new ArgumentException($"TheaterId {room.TheaterId} does not exist.");
            }

            // Tìm Room theo RoomId
            var existingRoom = await GetRoomById(room.RoomId); // Sử dụng hàm GetRoomById
            if (existingRoom != null)
            {
                existingRoom.Name = room.Name;
                existingRoom.SeatCapacity = room.SeatCapacity;
                existingRoom.IsActive = room.IsActive;
                existingRoom.TheaterId = room.TheaterId;
                await dbContext.SaveChangesAsync();
                return existingRoom;
            }

            // Nếu không tìm thấy Room, có thể ném ngoại lệ hoặc trả về null
            throw new ArgumentException($"Room with ID {room.RoomId} does not exist.");
        }


    }
}
