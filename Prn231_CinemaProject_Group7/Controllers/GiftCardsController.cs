using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Irepository;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GiftCardsController : Controller
	{
        private readonly IGiftCardRepository repository;

        public GiftCardsController(IGiftCardRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet("GetAllGiftCards")]
        public async Task<IActionResult> GetAllGiftCards()
        {
            var data = await repository.GetAllGiftCards();
            return Ok(data);
        }

        [HttpGet("GetGiftCard/{id}")]
        public IActionResult GetGiftCard(int id)
        {
            var data = repository.GetGiftCard(id);
            if(data == null)
            {
                return NotFound();
            }
            return Ok(data);
        }

        [HttpGet("GetGiftCardsByUserId/{id}")]
        public IActionResult GetGiftCardsByUserId(int id)
        {
            var data = repository.GetGiftCard(id);
            if (data == null)
            {
                return NotFound();
            }
            return Ok(data);
        }

        [HttpPost("CreateGiftCard")]
        public IActionResult CreateGiftCard(GiftCardDTO GiftCard)
        {
            var data = repository.CreateGiftCard(GiftCard);
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
            var data = repository.UpdateGiftCard(id, GiftCard);
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
            var data = repository.DeleteGiftCard(id);
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
