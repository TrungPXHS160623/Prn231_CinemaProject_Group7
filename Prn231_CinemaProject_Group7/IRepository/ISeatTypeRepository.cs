using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface ISeatTypeRepository
    {
        Task<List<SeatType>> GetAllSeatType();
        Task<SeatType> GetSeatTypeById(int seatTypeId);
        Task<SeatType> AddSeatType(SeatType seatType);

        Task<SeatType?> UpdateSeatType(SeatType seatType);

        Task<SeatType?> DeleteSeatType(int seatTypeId);

        Task<List<SeatType>> SearchSeatType(string typeName);

        Task<List<SeatType>> GetActiveSeatTypes();

        Task<SeatType?> DeActiveASeatType(int seatTypeId);

    }
}
