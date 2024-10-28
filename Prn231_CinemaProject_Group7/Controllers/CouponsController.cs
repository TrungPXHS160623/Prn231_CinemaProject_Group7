using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NuGet.Protocol.Core.Types;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRespository;
using Prn231_CinemaProject_Group7.Models;
using static Microsoft.AspNetCore.Razor.Language.TagHelperMetadata;

namespace Prn231_CinemaProject_Group7.Controllers
{
    public class CouponsController : Controller
    {

		private readonly ICouponRepository respository;

		public CouponsController(ICouponRepository respository)
		{
			this.respository = respository;
		}

		[HttpGet("GetAllCoupons")]
		public async Task<IActionResult> GetAllCoupons()
		{
			var data = await respository.GetAllCoupons();
			return Ok(data);
		}

		[HttpGet("GetCoupon/{id}")]
		public IActionResult GetCoupon(int id)
		{
			var data = respository.GetCoupon(id);
			return Ok(data);
		}

		[HttpPost("CreateCoupon")]
		public IActionResult CreateCoupon(CouponDTO Coupon)
		{
			var data = respository.CreateCoupon(Coupon);
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
			var data = respository.UpdateCoupon(id, Coupon);
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
			var data = respository.DeleteCoupon(id);
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
