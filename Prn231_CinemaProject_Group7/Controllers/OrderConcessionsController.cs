using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderConcessionsController : ControllerBase
    {
        private readonly IOrderConcessionRepository repository;

        public OrderConcessionsController(IOrderConcessionRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet("GetAllOrderConcessions")]
        public async Task<IActionResult> GetAllOrderConcessions()
        {
            var data = await repository.GetAllOrderConcessions();
            return Ok(data);
        }

        [HttpGet("GetOrderConcession/{id}")]
        public async Task<IActionResult> GetOrderConcession(int id)
        {
            var data = await repository.GetOrderConcession(id);
            if (data == null)
            {
                return NotFound();
            }
            return Ok(data);
        }

        [HttpPost("CreateOrderConcession")]
        public IActionResult CreateOrderConcession(OrderConcessionDTO OrderConcession)
        {
            var data = repository.CreateOrderConcession(OrderConcession);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("UpdateOrderConcession/{id}")]
        public IActionResult UpdateOrderConcession(int id, OrderConcessionDTO OrderConcession)
        {
            var data = repository.UpdateOrderConcession(id, OrderConcession);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("DeactivateOrderConcession/{id}")]
        public IActionResult DeactivateOrderConcession(int id)
        {
            var data = repository.DeleteOrderConcession(id);
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
