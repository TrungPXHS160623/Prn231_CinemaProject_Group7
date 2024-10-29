using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRespository;


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
        public async Task<IActionResult> GetConcession(int id)
        {
            var data = await respository.GetConcession(id);
            if (data == null)
            {
                return NotFound();
            }
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
			var data = respository.UpdateConcession(id, concession);
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
