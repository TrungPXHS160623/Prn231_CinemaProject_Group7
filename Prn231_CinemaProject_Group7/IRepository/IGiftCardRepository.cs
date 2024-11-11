using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Irepository
{
	public interface IGiftCardRepository
	{
		Task<List<GiftCard>> GetAllGiftCards();
		Task<GiftCard> GetGiftCard(int id);
		Task<List<GiftCard>> GetGiftCardsByUserId(int id);
        Task<bool> CreateGiftCard(GiftCardDTO giftCard);
		Task<bool> CreateGiftCardUser(int id, int userId);
        Task<bool> UpdateGiftCard(int id, GiftCardDTO giftCard);
		Task<bool> DeleteGiftCard(int id);
	}
}
