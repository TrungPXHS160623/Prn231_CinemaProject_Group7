using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRespository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
	public class CouponRepository : ICouponRepository
	{
		private readonly PRN231_CinemaContext _context;

		public CouponRepository(PRN231_CinemaContext _context)
		{
			this._context = _context;
		}
		public async Task<bool> CreateCoupon(CouponDTO Coupon)
		{
			try
			{
				var data = new Coupon();
				data.Code = Coupon.Code;
				data.Discount = Coupon.Discount;
				data.ExpirationDate = Coupon.ExpirationDate;
				data.IsActive = Coupon.IsActive;
				data.CreatedAt = DateTime.Now;
				_context.SaveChanges();
				return await Task.FromResult(true);
			}
			catch (Exception)
			{
				return await Task.FromResult(false);
			}
		}

		public async Task<bool> DeleteCoupon(int id)
		{
			try
			{
				var Coupon = _context.Coupons.Find(id);
				Coupon.IsActive = false;
				_context.SaveChanges();
				return await Task.FromResult(true);
			}
			catch (Exception)
			{
				return await Task.FromResult(false);
			}
		}

		public async Task<List<Coupon>> GetAllCoupons()
		{
			return await _context.Coupons.ToListAsync();
		}

		public async Task<Coupon> GetCoupon(int id)
		{
			return await _context.Coupons.FirstOrDefaultAsync(x => x.CouponId == id);
		}

		public async Task<bool> UpdateCoupon(int id, CouponDTO Coupon)
		{
			try
			{
				var data = new Coupon();
				data.Code = Coupon.Code;
				data.Discount = Coupon.Discount;
				data.ExpirationDate = Coupon.ExpirationDate;
				data.IsActive = Coupon.IsActive;
				data.UpdatedAt = DateTime.Now;
				_context.SaveChanges();
				return await Task.FromResult(true);
			}
			catch (Exception)
			{
				return await Task.FromResult(false);
			}
		}
	}
}
