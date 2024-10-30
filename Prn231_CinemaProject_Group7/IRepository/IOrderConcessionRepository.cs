using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface IOrderConcessionRepository
    {
        Task<List<OrderConcession>> GetAllOrderConcessions();
        Task<OrderConcession> GetOrderConcession(int id);
        Task<bool> CreateOrderConcession(OrderConcessionDTO OrderConcession);
        Task<bool> UpdateOrderConcession(int id, OrderConcessionDTO OrderConcession);
        Task<bool> DeleteOrderConcession(int id);
    }
}
