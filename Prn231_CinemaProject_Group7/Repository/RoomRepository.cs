using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;
using System.ComponentModel.Design;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class RoomRepository : IRoomRepository
    {
        private readonly Prn231_ProjectContext dbContext;

        public RoomRepository(Prn231_ProjectContext _dbContext)
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

        public async Task<List<Room>> GetActiveRooms()
        {
            return await dbContext.Rooms
                .Where(r => r.IsActive == true)
                .ToListAsync();
        }

        public async Task<List<Room>> GetAllRooms()
        {
            return await dbContext.Rooms.ToListAsync();
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
                throw new ArgumentException($"TheaterId {room.RoomId} does not exist.");
            }
            var existingRoom = await dbContext.Rooms.FirstOrDefaultAsync(r => r.RoomId == room.RoomId);
            if (existingRoom != null)
            {
                existingRoom.Name = room.Name;
                existingRoom.SeatCapacity = room.SeatCapacity;
                existingRoom.IsActive = room.IsActive;

                await dbContext.SaveChangesAsync();
                return existingRoom;
            }
            return null; // Hoặc có thể ném một ngoại lệ
        }
    }
}
