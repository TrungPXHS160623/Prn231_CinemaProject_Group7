using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestApiController : ControllerBase
    {
        public TestApiController()
        {
            
        }
        [HttpGet]
        public IActionResult Get()
        {



            return Ok("Hello World!!!!");
        }
    }
}
