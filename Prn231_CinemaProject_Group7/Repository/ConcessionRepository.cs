using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRespository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
	public class ConcessionRepository : IConsessionRepository
	{
		private readonly PRN231_CinemaContext _context;

		public ConcessionRepository(PRN231_CinemaContext _context)
        {
			this._context = _context;
		}
        public async Task<bool> CreateConcession(ConcessionDTO concession)
		{
			try
			{
				var data = new Concession();
				data.ProductName = concession.ProductName;
				data.Description = concession.Description;
				data.Price = concession.Price;
				data.StockQuantity = concession.StockQuantity;
				data.IsActive = concession.IsActive;
				data.CreatedAt = DateTime.Now;
				_context.SaveChanges();
				return await Task.FromResult(true);
			}
			catch (Exception)
			{
				return await Task.FromResult(false);
			}
		}

		public async Task<bool> DeleteConcession(int id)
		{
			try
			{
				var concession = _context.Concessions.Find(id);
				concession.IsActive = false;
				_context.SaveChanges();
				return await Task.FromResult(true);
			}
			catch (Exception)
			{
				return await Task.FromResult(false);
			}
		}

		public async Task<List<Concession>> GetAllConcessions()
		{
			return await _context.Concessions.ToListAsync();
		}

		public async Task<Concession> GetConcession(int id)
		{
			return await _context.Concessions.FirstOrDefaultAsync(x => x.ProductId == id);
		}

		public async Task<bool> UpdateConcession(int id, ConcessionDTO concession)
		{
			try
			{
				var data = new Concession();
				data.ProductName = concession.ProductName;
				data.Description = concession.Description;
				data.Price = concession.Price;
				data.StockQuantity = concession.StockQuantity;
				data.IsActive = concession.IsActive;
				data.UpdatedAt = DateTime.Now;
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
