using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly IOrderRepository repository;

        public OrdersController(IOrderRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet("GetAllOrders")]
        public async Task<IActionResult> GetAllOrders()
        {
            var data = await repository.GetAllOrders();
            return Ok(data);
        }

        [HttpGet("GetOrder/{id}")]
        public IActionResult GetOrder(int id)
        {
            var data = repository.GetOrder(id);
            return Ok(data);
        }

        [HttpPost("CreateOrder")]
        public IActionResult CreateOrder(OrderDTO Order)
        {
            var data = repository.CreateOrder(Order);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("UpdateOrder/{id}")]
        public IActionResult UpdateOrder(int id, OrderDTO Order)
        {
            var data = repository.UpdateOrder(id, Order);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("DeactivateOrder/{id}")]
        public IActionResult DeactivateOrder(int id)
        {
            var data = repository.DeleteOrder(id);
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
