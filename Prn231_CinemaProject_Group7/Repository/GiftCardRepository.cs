using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRespository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
	public class GiftCardRepository : IGiftCardRepository
	{
		private readonly PRN231_CinemaContext _context;

		public GiftCardRepository(PRN231_CinemaContext _context)
		{
			this._context = _context;
		}
		public async Task<bool> CreateGiftCard(GiftCardDTO GiftCard)
		{
			try
			{
				var data = new GiftCard();
				data.Code = GiftCard.Code;
				data.Balance = GiftCard.Balance;
				data.ExpirationDate = GiftCard.ExpirationDate;
				data.IsActive = GiftCard.IsActive;
				data.CreatedAt = DateTime.Now;
				_context.SaveChanges();
				return await Task.FromResult(true);
			}
			catch (Exception)
			{
				return await Task.FromResult(false);
			}
		}

		public async Task<bool> DeleteGiftCard(int id)
		{
			try
			{
				var GiftCard = _context.GiftCards.Find(id);
				GiftCard.IsActive = false;
				_context.SaveChanges();
				return await Task.FromResult(true);
			}
			catch (Exception)
			{
				return await Task.FromResult(false);
			}
		}

		public async Task<List<GiftCard>> GetAllGiftCards()
		{
			return await _context.GiftCards.ToListAsync();
		}

		public async Task<GiftCard> GetGiftCard(int id)
		{
			return await _context.GiftCards.FirstOrDefaultAsync(x => x.GiftCardId == id);
		}

		public async Task<bool> UpdateGiftCard(int id, GiftCardDTO GiftCard)
		{
			try
			{
				var data = new GiftCard();
				data.Code = GiftCard.Code;
				data.Balance = GiftCard.Balance;
				data.ExpirationDate = GiftCard.ExpirationDate;
				data.IsActive = GiftCard.IsActive;
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
