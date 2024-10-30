using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Irepository
{
	public interface ICouponRepository
	{
		Task<List<Coupon>> GetAllCoupons();
		Task<Coupon> GetCoupon(int id);
		Task<bool> CreateCoupon(CouponDTO coupon);
		Task<bool> UpdateCoupon(int id, CouponDTO coupon);
		Task<bool> DeleteCoupon(int id);
	}
}
