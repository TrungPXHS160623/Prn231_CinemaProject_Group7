using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Hosting;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Models.Dtos.SeatDtos;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class SeatRepository : ISeatRepository
    {
        private readonly Prn231_Project_FinalContext dbContext;

        public SeatRepository(Prn231_Project_FinalContext _dbContext)
        {
            dbContext = _dbContext;
        }
        public async Task<Seat> AddSeat(Seat seat)
        {
            // Kiểm tra RoomId có tồn tại không
            var roomExists = await dbContext.Rooms.AnyAsync(r => r.RoomId == seat.RoomId);
            if (!roomExists)
            {
                throw new ArgumentException($"RoomId {seat.RoomId} does not exist.");
            }

            // Kiểm tra SeatTypeId có tồn tại không
            var seatTypeExists = await dbContext.SeatTypes.AnyAsync(st => st.SeatTypeId == seat.SeatTypeId);
            if (!seatTypeExists)
            {
                throw new ArgumentException($"SeatTypeId {seat.SeatTypeId} does not exist.");
            }

            await dbContext.Seats.AddAsync(seat);
            await dbContext.SaveChangesAsync();
            return seat;
        }

        public async Task<Seat?> DeactivateSeat(int seatId)
        {
            //tìm ghế theo id
            var myseat = await dbContext.Seats.FirstOrDefaultAsync(s => s.SeatId == seatId);
        
        
            if(myseat != null)
            {
                myseat.IsActive = false;
                await dbContext.SaveChangesAsync();
            }

            // Trả về ghế đã vô hiệu hóa hoặc null nếu không tìm thấy
            return myseat;
        }

        public async Task<bool> DeleteSeat(int seatId)
        {
            var myseat = await dbContext.Seats.FirstOrDefaultAsync(s => s.SeatId == seatId);
            if (myseat != null)
            {
                dbContext.Seats.Remove(myseat);
                await dbContext.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public Task<List<Seat>> GetActiveSeatsByRoomId(int roomId)
        {
            // Lọc và lấy danh sách ghế đang hoạt động theo phòng
            var list  = dbContext.Seats.Where(s => s.RoomId == roomId && s.IsActive == true).ToListAsync();
            return list;
        }
        public async Task<List<SeatDto>> GetSeatByShowTime(int showtimeId)
        {
            // Lọc và lấy danh sách ghế theo showtimeId
            var seats = await dbContext.Seats
                .Include(s => s.SeatType)
                .Where(s => s.Room.Showtimes.Any(st => st.ShowtimeId == showtimeId)
                && s.IsActive != false
                && s.IsAvailable != false)
                .Select(s => new SeatDto
                {
                    SeatId = s.SeatId,
                    RoomId = s.RoomId,
                    SeatTypeId = s.SeatTypeId,
                    SeatNumber = s.SeatNumber,
                    RowName = s.RowName,
                    IsAvailable = s.IsAvailable,
                    IsActive = s.IsActive,
                    TypeName = s.SeatType.TypeName
                })
                .ToListAsync();
            return seats;
        }
        public Task<List<Seat>> GetAvailableSeatsByRoomId(int roomId)
        {
            // Lọc và lấy danh sách ghế đang có sẵn theo phòng
            var list = dbContext.Seats.Where(s => s.RoomId == roomId && s.IsAvailable == true).ToListAsync();
            return list;
        }

        public async Task<SeatDto> GetSeatById(int seatId)
        {
            var seat = await dbContext.Seats
           .Include(s => s.Room)
           .Include(s => s.SeatType)
           .Select(s => new SeatDto
           {
               SeatId = s.SeatId,
               RoomId = s.RoomId,
               SeatTypeId = s.SeatTypeId,
               SeatNumber = s.SeatNumber,
               RowName = s.RowName,
               IsAvailable = s.IsAvailable,
               IsActive = s.IsActive,
               Price = s.SeatType.Price,
           })
           .SingleOrDefaultAsync(s => s.SeatId == seatId);

            if (seat == null)
            {
                throw new KeyNotFoundException($"Seat with ID {seatId} was not found.");
            }

            return seat;
        }

        public Task<List<Seat>> GetSeatByRoomId(int roomId)
        {
            // Lấy danh sách tất cả các ghế theo phòng
            var list = dbContext.Seats.Where(s => s.RoomId == roomId).ToListAsync();
            return list;
        }

        public async Task<bool> IsSeatAvailable(int seatId)
        {
            //  Tìm ghế theo ID
            var seat = await dbContext.Seats
                .FirstOrDefaultAsync(s => s.SeatId == seatId);

            // Kiểm tra xem ghế có tồn tại và có còn trống hay không
            if(seat == null || seat.IsAvailable == false || seat.IsActive == false)
            {
                return false; // Ghế không tồn tại hoặc không còn trống
            }
            return true; // Ghế còn trống
        }

        public async Task<Seat?> ReserveSeat(int seatId)
        {
            // Tìm ghế theo ID
            var seat = await dbContext.Seats.FirstOrDefaultAsync(s => s.SeatId == seatId);

            // Kiểm tra nếu ghế tồn tại, đang trống và đang hoạt động
            if (seat == null || seat.IsAvailable == false || seat.IsActive == false)
            {
                return null; // Ghế không tồn tại hoặc không sẵn sàng để đặt
            }

            // Cập nhật trạng thái ghế để đánh dấu ghế đã được đặt
            seat.IsAvailable = false;

            // Lưu thay đổi vào cơ sở dữ liệu
            await dbContext.SaveChangesAsync();

            return seat; // Trả về thông tin ghế đã được đặt
        }

        public async Task<List<Seat>> SearchSeatsByType(int roomId, int seatTypeId)
        {
            // Truy vấn cơ sở dữ liệu để lấy danh sách ghế theo roomId và seatTypeId
            var seats = await dbContext.Seats
                .Where(seat => seat.RoomId == roomId && seat.SeatTypeId == seatTypeId && seat.IsActive == true)
                .ToListAsync();

            return seats; // Trả về danh sách các ghế tìm được
        }

        public async Task<Seat?> UnreserveSeat(int seatId)
        {
            // Tìm ghế theo ID
            var seat = await dbContext.Seats.FindAsync(seatId);

            // Kiểm tra xem ghế có tồn tại và đã được đặt hay không
            if (seat == null || seat.IsAvailable == true || seat.IsActive == false)
            {
                return null; // Ghế không tồn tại, chưa được đặt, hoặc không hoạt động
            }

            // Cập nhật trạng thái ghế để đánh dấu ghế đã được bỏ đặt chỗ
            seat.IsAvailable = true;

            // Lưu thay đổi vào cơ sở dữ liệu
            await dbContext.SaveChangesAsync();

            return seat; // Trả về thông tin ghế đã được bỏ đặt chỗ
        }

        public async Task<Seat> UpdateSeat(Seat seat)
        {
            // Kiểm tra RoomId có tồn tại không
            var roomExists = await dbContext.Rooms.AnyAsync(r => r.RoomId == seat.RoomId);
            if (!roomExists)
            {
                throw new ArgumentException($"RoomId {seat.RoomId} does not exist.");
            }

            // Kiểm tra SeatTypeId có tồn tại không
            var seatTypeExists = await dbContext.SeatTypes.AnyAsync(st => st.SeatTypeId == seat.SeatTypeId);
            if (!seatTypeExists)
            {
                throw new ArgumentException($"SeatTypeId {seat.SeatTypeId} does not exist.");
            }
            var existingSeat = await dbContext.Seats.FirstOrDefaultAsync(s => s.SeatId == seat.SeatId);
            if (existingSeat != null)
            {
                existingSeat.RoomId = seat.RoomId;
                existingSeat.SeatTypeId = seat.SeatTypeId;
                existingSeat.SeatNumber = seat.SeatNumber;
                existingSeat.RowName = seat.RowName;
                existingSeat.IsAvailable = seat.IsAvailable;
                existingSeat.IsActive = seat.IsActive;
            }

            await dbContext.SaveChangesAsync();
            return existingSeat;
        }

        public async Task<List<Seat>> GetAllSeats()
        {
            return await dbContext.Seats.ToListAsync();
        }
    }
}
