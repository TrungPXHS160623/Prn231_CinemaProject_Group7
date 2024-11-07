using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NewsController : ControllerBase
    {
        private readonly INewsRepository repository;

        public NewsController(INewsRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet("GetAllNews")]
        public async Task<IActionResult> GetAllNews()
        {
            var data = await repository.GetAllNews();
            return Ok(data);
        }

        [HttpGet("GetNew/{id}")]
        public async Task<IActionResult> GetNews(int id)
        {
            var data = await repository.GetNews(id);
            return Ok(data);
        }

        [HttpPost("CreateNew")]
        public IActionResult CreateNew(NewsDTO New)
        {
            var data = repository.CreateNews(New);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("UpdateNew/{id}")]
        public IActionResult UpdateNew(int id, NewsDTO New)
        {
            var data = repository.UpdateNews(id, New);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("DeactivateNew/{id}")]
        public IActionResult DeactivateNew(int id)
        {
            var data = repository.DeleteNews(id);
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
