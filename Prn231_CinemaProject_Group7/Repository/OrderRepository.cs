using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRespository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class OrderRepository : IOrderRepository
    {
        private readonly Prn231_Project_FinalContext _context;

        public OrderRepository(Prn231_Project_FinalContext _context)
        {
            this._context = _context;
        }
        public async Task<bool> CreateOrder(OrderDTO orderDto)
        {
            try
            {
                var order = new Order
                {
                    CustomerId = orderDto.CustomerId,
                    OrderDate = orderDto.OrderDate,
                    TotalAmount = orderDto.TotalAmount,
                    IsPaid = orderDto.IsPaid,
                    PaymentMethod = orderDto.PaymentMethod,
                    StatusId = orderDto.StatusId,
                    CouponId = orderDto.CouponId,
                    GiftCardId = orderDto.GiftCardId,
                    OrderConcessions = orderDto.OrderConcessions.Select(oc => new OrderConcession
                    {
                        ConcessionId = oc.ConcessionId,
                        Quantity = oc.Quantity,
                        Price = oc.Price
                    }).ToList(),
                    OrderDetails = orderDto.OrderDetails.Select(od => new OrderDetail
                    {
                        ShowtimeId = od.ShowtimeId,
                        SeatId = od.SeatId,
                        Quantity = od.Quantity,
                        Price = od.Price
                    }).ToList()
                };
                _context.Orders.Add(order);
                _context.SaveChanges();
                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }

        public async Task<bool> DeleteOrder(int id)
        {
            try
            {
                var Order = _context.Orders.Find(id);
                
                _context.SaveChanges();
                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }

        public async Task<List<Order>> GetAllOrders()
        {
            return await _context.Orders.ToListAsync();
        }

        public async Task<Order> GetOrder(int id)
        {
            return await _context.Orders.FirstOrDefaultAsync(x => x.OrderId == id);
        }

        public async Task<bool> UpdateOrder(int id, OrderDTO orderDto)
        {
            try
            {
                var data = _context.Orders.Find(id);
                data = new Order
                {
                    CustomerId = orderDto.CustomerId,
                    OrderDate = orderDto.OrderDate,
                    TotalAmount = orderDto.TotalAmount,
                    IsPaid = orderDto.IsPaid,
                    PaymentMethod = orderDto.PaymentMethod,
                    StatusId = orderDto.StatusId,
                    CouponId = orderDto.CouponId,
                    GiftCardId = orderDto.GiftCardId,
                    OrderConcessions = orderDto.OrderConcessions.Select(oc => new OrderConcession
                    {
                        ConcessionId = oc.ConcessionId,
                        Quantity = oc.Quantity,
                        Price = oc.Price
                    }).ToList(),
                    OrderDetails = orderDto.OrderDetails.Select(od => new OrderDetail
                    {
                        ShowtimeId = od.ShowtimeId,
                        SeatId = od.SeatId,
                        Quantity = od.Quantity,
                        Price = od.Price
                    }).ToList()
                };
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
