using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface IOrderDetailRepository
    {
        Task<List<OrderDetail>> GetAllOrderDetails();
        Task<OrderDetail> GetOrderDetail(int id);
        Task<bool> CreateOrderDetail(OrderDetailDTO OrderDetail);
        Task<bool> UpdateOrderDetail(int id, OrderDetailDTO OrderDetail);
        Task<bool> DeleteOrderDetail(int id);
    }
}
