﻿using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Irepository;


namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CouponsController : Controller
	{

		private readonly ICouponRepository repository;

		public CouponsController(ICouponRepository repository)
		{
			this.repository = repository;
		}

		[HttpGet("GetAllCoupons")]
		public async Task<IActionResult> GetAllCoupons()
		{
			var data = await repository.GetAllCoupons();
			return Ok(data);
		}
        [HttpGet("CreateCouponUser/{code}/{userId}")]
        public async Task<IActionResult> CreateCouponUser(string code, int userId)
        {
            var data = await repository.CreateCouponUser(code, userId);
            if (data)
            {
                return Ok();
            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet("GetCoupon/{id}")]
		public IActionResult GetCoupon(int id)
		{
			var data = repository.GetCoupon(id);
            if (data == null)
            {
                return NotFound();
            }
            return Ok(data);
		}

        [HttpGet("GetCouponsByUserId/{id}")]
        public IActionResult GetCouponsByUserId(int id)
        {
            var data = repository.GetCouponsByUserId(id);
            if (data == null)
            {
                return NotFound();
            }
            return Ok(data);
        }

        [HttpPost("CreateCoupon")]
		public IActionResult CreateCoupon(CouponDTO Coupon)
		{
			var data = repository.CreateCoupon(Coupon);
			if (data.Result)
			{
				return Ok();
			}
			else
			{
				return BadRequest();
			}
		}
		[HttpPut("UpdateCoupon/{id}")]
		public IActionResult UpdateCoupon(int id, CouponDTO Coupon)
		{
			var data = repository.UpdateCoupon(id, Coupon);
			if (data.Result)
			{
				return Ok();
			}
			else
			{
				return BadRequest();
			}
		}
		[HttpPut("DeactivateCoupon/{id}")]
		public IActionResult DeactivateCoupon(int id)
		{
			var data = repository.DeleteCoupon(id);
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
