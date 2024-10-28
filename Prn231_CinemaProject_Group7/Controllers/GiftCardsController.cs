using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Controllers
{
    public class GiftCardsController : Controller
    {
        private readonly PRN231_CinemaContext _context;

        public GiftCardsController(PRN231_CinemaContext context)
        {
            _context = context;
        }

		[HttpGet("GetAllGiftCards")]
		public IActionResult GetAllGiftCards()
		{

			return Ok();
		}

		[HttpGet("GetGiftCard/{id}")]
		public IActionResult GetGiftCard(int id)
		{

			return Ok();
		}

		[HttpPost("CreateGiftCard")]
		public IActionResult CreateGiftCard()
		{

			return Ok();
		}
		[HttpPut("UpdateGiftCard/{id}")]
		public IActionResult UpdateGiftCard(int id)
		{

			return Ok();
		}
		[HttpDelete("DeactivateGiftCard/{id}")]
		public IActionResult DeactivateGiftCard(int id)
		{
			if(!GiftCardExists(id))
			{
				return NotFound();
			}
			try
			{
				var giftCard = _context.GiftCards.Find(id);
				giftCard.IsActive = false;
			}
			catch (Exception)
			{
				return BadRequest();
			}
			return Ok();
		}

		private bool GiftCardExists(int id)
        {
          return (_context.GiftCards?.Any(e => e.GiftCardId == id)).GetValueOrDefault();
        }
    }
}
