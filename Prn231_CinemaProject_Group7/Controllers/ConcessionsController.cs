using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRespository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ConcessionsController : Controller
	{
		private readonly IConsessionRepository respository;

		public ConcessionsController(IConsessionRepository respository)
		{
			this.respository = respository;
		}

		[HttpGet("GetAllConcessions")]
		public async Task<IActionResult> GetAllConcessions()
		{
			var data = await respository.GetAllConcessions();
			return Ok(data);
		}

		[HttpGet("GetConcession/{id}")]
		public IActionResult GetConcession(int id)
		{
			var data = respository.GetConcession(id);
			return Ok(data);
		}

		[HttpPost("CreateConcession")]
		public IActionResult CreateConcession(ConcessionDTO concession)
		{
			var data = respository.CreateConcession(concession);
			if (data.Result)
			{
				return Ok();
			}
			else
			{
				return BadRequest();
			}
		}
		[HttpPut("UpdateConcession/{id}")]
		public IActionResult UpdateConcession(int id, ConcessionDTO concession)
		{
			var data = respository.UpdateConcession(id,concession);
			if (data.Result)
			{
				return Ok();
			}
			else
			{
				return BadRequest();
			}
		}
		[HttpPut("DeactivateConcession/{id}")]
		public IActionResult DeactivateConcession(int id)
		{
			var data = respository.DeleteConcession(id);
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
