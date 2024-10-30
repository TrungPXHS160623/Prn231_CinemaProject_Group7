using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;


namespace Prn231_CinemaProject_Group7.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ConcessionsController : Controller
	{
		private readonly IConsessionRepository repository;

		public ConcessionsController(IConsessionRepository repository)
		{
			this.repository = repository;
		}

		[HttpGet("GetAllConcessions")]
		public async Task<IActionResult> GetAllConcessions()
		{
			var data = await repository.GetAllConcessions();
			return Ok(data);
		}

        [HttpGet("GetConcession/{id}")]
        public async Task<IActionResult> GetConcession(int id)
        {
            var data = await repository.GetConcession(id);
            if (data == null)
            {
                return NotFound();
            }
            return Ok(data);
        }

        [HttpPost("CreateConcession")]
		public IActionResult CreateConcession(ConcessionDTO concession)
		{
			var data = repository.CreateConcession(concession);
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
			var data = repository.UpdateConcession(id, concession);
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
			var data = repository.DeleteConcession(id);
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
