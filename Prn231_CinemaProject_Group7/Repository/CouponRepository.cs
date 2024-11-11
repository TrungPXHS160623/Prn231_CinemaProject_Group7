using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Irepository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
	public class CouponRepository : ICouponRepository
	{
		private readonly Prn231_Project_FinalContext _context;

		public CouponRepository(Prn231_Project_FinalContext _context)
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
				_context.Coupons.Add(data);
                _context.SaveChanges();
				return await Task.FromResult(true);
			}
			catch (Exception)
			{
				return await Task.FromResult(false);
			}
		}

        public async Task<bool> CreateCouponUser(string coupon, int userId)
        {
            try
            {
				var data = _context.Coupons.Where(c => c.Code.Equals(coupon) && c.IsActive != false).FirstOrDefault();
				if(data == null)
				{
                    return await Task.FromResult(false);
                }
				var copounUser = new CouponUser
				{
					CouponId = data.CouponId,
					CreateAt = DateTime.Now.ToLocalTime(),
					UpdateAt = DateTime.Now.ToLocalTime(),
					UserId = userId
                };
				_context.CouponUsers.Add(copounUser);
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

		public async Task<Coupon?> GetCoupon(int id)
		{
			return _context.Coupons.First(x => x.CouponId == id);
        }
        public async Task<List<Coupon>> GetCouponsByUserId(int id)
        {
            return _context.CouponUsers
                .Include(cu => cu.Coupon)
				.Where(cu => cu.UserId == id 
				&& cu.Coupon.IsActive != false)
				.Select(cu => cu.Coupon)
				.ToList();
        }

        public async Task<bool> UpdateCoupon(int id, CouponDTO Coupon)
		{
			try
			{
				var data = _context.Coupons.Find(id);
                data.Code = Coupon.Code;
				data.Discount = Coupon.Discount;
				data.ExpirationDate = Coupon.ExpirationDate;
				data.IsActive = Coupon.IsActive;
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
