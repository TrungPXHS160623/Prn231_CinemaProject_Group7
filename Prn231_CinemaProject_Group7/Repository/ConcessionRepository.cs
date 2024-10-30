using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class ConcessionRepository : IConsessionRepository
    {
        private readonly Prn231_Project_FinalContext _context;

        public ConcessionRepository(Prn231_Project_FinalContext _context)
        {
            this._context = _context;
        }

        public async Task<bool> CreateConcession(ConcessionDTO concession)
        {
            try
            {
                var data = new Concession
                {
                    ProductName = concession.ProductName,
                    Description = concession.Description,
                    Price = concession.Price,
                    StockQuantity = concession.StockQuantity,
                    IsActive = concession.IsActive
                };
                _context.Concessions.Add(data);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> DeleteConcession(int id)
        {
            try
            {
                var concession = await _context.Concessions.FindAsync(id);
                if (concession == null)
                {
                    return false;
                }
                concession.IsActive = false;
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<List<Concession>> GetAllConcessions()
        {
            return await _context.Concessions.ToListAsync();
        }

        public async Task<Concession?> GetConcession(int id)
        {
            return await _context.Concessions.FirstOrDefaultAsync(x => x.ProductId == id);
        }

        public async Task<bool> UpdateConcession(int id, ConcessionDTO concession)
        {
            try
            {
                var data = await _context.Concessions.FindAsync(id);
                if (data == null)
                {
                    return false;
                }
                data.ProductName = concession.ProductName;
                data.Description = concession.Description;
                data.Price = concession.Price;
                data.StockQuantity = concession.StockQuantity;
                data.IsActive = concession.IsActive;
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}