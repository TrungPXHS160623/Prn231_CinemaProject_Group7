using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface IOrderRepository
    {
        Task<List<OrderSummaryDTO>> GetAllOrders();
        Task<Order> GetOrder(int id);
        Task<bool> CreateOrder(OrderDTO order);
        Task<bool> UpdateOrder(int id, OrderDTO order);
        Task<bool> DeleteOrder(int id);
    }
}
