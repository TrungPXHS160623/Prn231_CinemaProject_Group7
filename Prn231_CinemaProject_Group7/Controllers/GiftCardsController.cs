using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRespository;

namespace Prn231_CinemaProject_Group7.Controllers
{
	public class GiftCardsController : Controller
	{
        private readonly IGiftCardRepository respository;

        public GiftCardsController(IGiftCardRepository respository)
        {
            this.respository = respository;
        }

        [HttpGet("GetAllGiftCards")]
        public async Task<IActionResult> GetAllGiftCards()
        {
            var data = await respository.GetAllGiftCards();
            return Ok(data);
        }

        [HttpGet("GetGiftCard/{id}")]
        public IActionResult GetGiftCard(int id)
        {
            var data = respository.GetGiftCard(id);
            return Ok(data);
        }

        [HttpPost("CreateGiftCard")]
        public IActionResult CreateGiftCard(GiftCardDTO GiftCard)
        {
            var data = respository.CreateGiftCard(GiftCard);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("UpdateGiftCard/{id}")]
        public IActionResult UpdateGiftCard(int id, GiftCardDTO GiftCard)
        {
            var data = respository.UpdateGiftCard(id, GiftCard);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("DeactivateGiftCard/{id}")]
        public IActionResult DeactivateGiftCard(int id)
        {
            var data = respository.DeleteGiftCard(id);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
    }
}
