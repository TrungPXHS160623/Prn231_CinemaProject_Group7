using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;
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
                Order.StatusId = 4;
                _context.SaveChanges();
                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }

        public async Task<List<OrderSummaryDTO>> GetAllOrders()
        {
            return await _context.Orders
                .Include(o => o.Customer)
                .Include(o => o.Status)
                .Include(o => o.Coupon)
                .Include(o => o.GiftCard)
                .Include(o => o.OrderConcessions)
                    .ThenInclude(oc => oc.Concession)
                .Include(o => o.OrderDetails)
                    .ThenInclude(od => od.Showtime)
                .Include(o => o.OrderDetails)
                    .ThenInclude(od => od.Seat)
                        .ThenInclude(s => s.Room)
                            .ThenInclude(r => r.Theater)
                .Select(order => new OrderSummaryDTO
                {
                    OrderId = order.OrderId,
                    Customer = new CustomerInfoDTO
                    {
                        FirstName = order.Customer.FirstName,
                        LastName = order.Customer.LastName
                    },
                    OrderDate = order.OrderDate,
                    TotalAmount = order.TotalAmount,
                    IsPaid = order.IsPaid,
                    PaymentMethod = order.PaymentMethod,
                    Status = new OrderStatusDTO
                    {
                        StatusName = order.Status.StatusName
                    },
                    Coupon = order.Coupon != null ? new CouponInfoDTO
                    {
                        Discount = order.Coupon.Discount
                    } : null,
                    GiftCard = order.GiftCard != null ? new GiftCardInfoDTO
                    {
                        Balance = order.GiftCard.Balance
                    } : null,
                    OrderConcessions = order.OrderConcessions.Select(oc => new OrderConcessionInfoDTO
                    {
                        Concession = new ConcessionInfoDTO
                        {
                            ProductName = oc.Concession.ProductName
                        },
                        Quantity = oc.Quantity,
                        Price = oc.Price
                    }).ToList(),
                    OrderDetails = order.OrderDetails.Select(od => new OrderDetailInfoDTO
                    {
                        Showtime = new ShowtimeInfoDTO
                        {
                            StartTime = od.Showtime.StartTime,
                            EndTime = od.Showtime.EndTime
                        },
                        Seat = new SeatInfoDTO
                        {
                            SeatNumber = od.Seat.SeatNumber,
                            Room = new RoomInfoDTO
                            {
                                Name = od.Seat.Room.Name,
                                Theater = new TheaterInfoDTO
                                {
                                    Name = od.Seat.Room.Theater.Name
                                }
                            }
                        },
                        Quantity = od.Quantity,
                        Price = od.Price
                    }).ToList()
                })
                .ToListAsync();
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
