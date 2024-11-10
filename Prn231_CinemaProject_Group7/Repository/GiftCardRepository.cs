﻿using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Irepository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
	public class GiftCardRepository : IGiftCardRepository
	{
		private readonly Prn231_Project_FinalContext _context;

		public GiftCardRepository(Prn231_Project_FinalContext _context)
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
			return _context.GiftCards.FirstOrDefault(x => x.GiftCardId == id);
		}

        public async Task<List<GiftCard>> GetGiftCardsByUserId(int id)
        {
            return await _context.GiftCardUsers
                                 .Where(cu => cu.UserId == id)
                                 .Select(cu => cu.GiftCard)
                                 .ToListAsync();
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
