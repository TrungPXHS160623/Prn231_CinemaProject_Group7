using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class OrderDetailRepository : IOrderDetailRepository
    {
        private readonly Prn231_Project_FinalContext _context;

        public OrderDetailRepository(Prn231_Project_FinalContext _context)
        {
            this._context = _context;
        }
        public async Task<bool> CreateOrderDetail(OrderDetailDTO OrderDetail)
        {
            try
            {
                var data = new OrderDetail
                {
                    OrderId = OrderDetail.OrderId,
                    ShowtimeId = OrderDetail.ShowtimeId,
                    SeatId = OrderDetail.SeatId,
                    Quantity = OrderDetail.Quantity,
                    Price = OrderDetail.Price
                };
                _context.OrderDetails.Add(data);

                var order = _context.Orders.Find(OrderDetail.OrderId);
                var coupon = _context.Coupons.Find(order.CouponId);

                if (coupon != null)
                {
                    order.TotalAmount += OrderDetail.Price * (100 - coupon.Discount);
                }
                else
                {
                    order.TotalAmount += OrderDetail.Price;
                }

                _context.SaveChanges();
                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }

        public async Task<bool> DeleteOrderDetail(int id)
        {
            try
            {
                var OrderDetail = _context.OrderDetails.Find(id);
                _context.OrderDetails.Remove(OrderDetail);
                _context.SaveChanges();
                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }

        public async Task<List<OrderDetail>> GetAllOrderDetails()
        {
            return await _context.OrderDetails.ToListAsync();
        }

        public async Task<OrderDetail> GetOrderDetail(int id)
        {
            return await _context.OrderDetails.FirstOrDefaultAsync(x => x.OrderDetailId == id);
        }

        public async Task<bool> UpdateOrderDetail(int id, OrderDetailDTO OrderDetail)
        {
            try
            {
                var data = _context.OrderDetails.Find(id);
                if (data == null)
                {
                    return await Task.FromResult(false);
                }
                data.OrderId = OrderDetail.OrderId;
                data.ShowtimeId = OrderDetail.ShowtimeId;
                data.SeatId = OrderDetail.SeatId;
                data.Quantity = OrderDetail.Quantity;

                var order = _context.Orders.Find(OrderDetail.OrderId);
                var coupon = _context.Coupons.Find(order.CouponId);

                if (coupon != null)
                {
                    order.TotalAmount += OrderDetail.Price * (100 - coupon.Discount) - data.Price;
                }
                else
                {
                    order.TotalAmount += OrderDetail.Price - data.Price;
                }

                data.Price = OrderDetail.Price;
                _context.SaveChanges();
                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }
    }
}
