using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderDetailsController : ControllerBase
    {
        private readonly IOrderDetailRepository repository;

        public OrderDetailsController(IOrderDetailRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet("GetAllOrderDetails")]
        public async Task<IActionResult> GetAllOrderDetails()
        {
            var data = await repository.GetAllOrderDetails();
            return Ok(data);
        }

        [HttpGet("GetOrderDetail/{id}")]
        public async Task<IActionResult> GetOrderDetail(int id)
        {
            var data = await repository.GetOrderDetail(id);
            if (data == null)
            {
                return NotFound();
            }
            return Ok(data);
        }

        [HttpPost("CreateOrderDetail")]
        public IActionResult CreateOrderDetail(OrderDetailDTO OrderDetail)
        {
            var data = repository.CreateOrderDetail(OrderDetail);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("UpdateOrderDetail/{id}")]
        public IActionResult UpdateOrderDetail(int id, OrderDetailDTO OrderDetail)
        {
            var data = repository.UpdateOrderDetail(id, OrderDetail);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("DeactivateOrderDetail/{id}")]
        public IActionResult DeactivateOrderDetail(int id)
        {
            var data = repository.DeleteOrderDetail(id);
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
