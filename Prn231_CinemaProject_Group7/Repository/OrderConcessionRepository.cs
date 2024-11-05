using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class OrderConcessionRepository : IOrderConcessionRepository
    {
        private readonly Prn231_Project_FinalContext _context;

        public OrderConcessionRepository(Prn231_Project_FinalContext _context)
        {
            this._context = _context;
        }
        public async Task<bool> CreateOrderConcession(OrderConcessionDTO OrderConcession)
        {
            try
            {
                var data = new OrderConcession
                {
                    OrderId = OrderConcession.OrderId,
                    ConcessionId = OrderConcession.ConcessionId,
                    Quantity = OrderConcession.Quantity,
                    Price = OrderConcession.Price
                };
                _context.OrderConcessions.Add(data);
                var concession = _context.Concessions.Find(OrderConcession.ConcessionId);
                concession.StockQuantity -= OrderConcession.Quantity;
                _context.SaveChanges();
                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }

        public async Task<bool> DeleteOrderConcession(int id)
        {
            try
            {
                var OrderConcession = _context.OrderConcessions.Find(id);
                var concession = _context.Concessions.Find(OrderConcession.ConcessionId);
                concession.StockQuantity += OrderConcession.Quantity;
                _context.OrderConcessions.Remove(OrderConcession);
                _context.SaveChanges();
                return await Task.FromResult(true);
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }

        public async Task<List<OrderConcession>> GetAllOrderConcessions()
        {
            return await _context.OrderConcessions.ToListAsync();
        }

        public async Task<OrderConcession> GetOrderConcession(int id)
        {
            return await _context.OrderConcessions.FirstOrDefaultAsync(x => x.OrderConcessionId == id);
        }

        public async Task<bool> UpdateOrderConcession(int id, OrderConcessionDTO OrderConcession)
        {
            try
            {
                var data = _context.OrderConcessions.Find(id);
                data.OrderId = OrderConcession.OrderId;
                data.ConcessionId = OrderConcession.ConcessionId;
                var concession = _context.Concessions.Find(OrderConcession.ConcessionId);
                concession.StockQuantity += data.Quantity - OrderConcession.Quantity;
                data.Quantity = OrderConcession.Quantity;
                data.Price = OrderConcession.Price;
                
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
