using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class SeatTypeRepository : ISeatTypeRepository
    {
        private readonly Prn231_ProjectContext dbContext;

        public SeatTypeRepository(Prn231_ProjectContext _dbContext)
        {
            dbContext = _dbContext;
        }

        public async Task<SeatType> AddSeatType(SeatType seatType)
        {
            await dbContext.SeatTypes.AddAsync(seatType);
            await dbContext.SaveChangesAsync();
            return seatType;
        }

        public async Task<SeatType> UpdateSeatType(SeatType seatType)
        {
            var existingSeatType = await dbContext.SeatTypes.FirstOrDefaultAsync(st => st.SeatTypeId == seatType.SeatTypeId);
            if (existingSeatType != null)
            {
                existingSeatType.TypeName = seatType.TypeName;
                existingSeatType.Description = seatType.Description;
                existingSeatType.Price = seatType.Price;
                existingSeatType.IsActive = seatType.IsActive;
            }

            await dbContext.SaveChangesAsync();
            return existingSeatType;
        }

        // Xóa loại ghế theo ID
        public async Task<SeatType> DeleteSeatType(int seatTypeId)
        {
            var seatType = await dbContext.SeatTypes.FirstOrDefaultAsync(st => st.SeatTypeId == seatTypeId);
            if (seatType != null)
            {
                dbContext.SeatTypes.Remove(seatType);
                await dbContext.SaveChangesAsync();
            }
            return seatType;
        }
        // Lấy tất cả các loại ghế đang hoạt động
        public async Task<List<SeatType>> GetActiveSeatTypes()
        {
            return await dbContext.SeatTypes.Where(st => st.IsActive == true).ToListAsync();
        }
        // Lấy tất cả các loại ghế
        public async Task<List<SeatType>> GetAllSeatType()
        {
            return await dbContext.SeatTypes.ToListAsync();
        }
        // Lấy loại ghế theo ID
        public async Task<SeatType> GetSeatTypeById(int seatTypeId)
        {
            return await dbContext.SeatTypes.FirstOrDefaultAsync(st => st.SeatTypeId == seatTypeId);
        }
        // Tìm kiếm loại ghế theo tên
        public async Task<List<SeatType>> SearchSeatType(string typeName)
        {
            return await dbContext.SeatTypes.Where(st => st.TypeName.Contains(typeName)).ToListAsync();
        }

        public async Task<SeatType?> DeActiveASeatType(int seatTypeId)
        {
            var seatType = await dbContext.SeatTypes.FirstOrDefaultAsync(st => st.SeatTypeId == seatTypeId);
            if(seatType != null)
            {
                seatType.IsActive = false;
                await dbContext.SaveChangesAsync();
            }
            return seatType;
        }
    }
}
