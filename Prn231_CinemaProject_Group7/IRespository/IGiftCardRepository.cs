using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRespository
{
	public interface IGiftCardRepository
	{
		Task<List<GiftCard>> GetAllGiftCards();
		Task<GiftCard> GetGiftCard(int id);
		Task<bool> CreateGiftCard(GiftCardDTO giftCard);
		Task<bool> UpdateGiftCard(int id, GiftCardDTO giftCard);
		Task<bool> DeleteGiftCard(int id);
	}
}
