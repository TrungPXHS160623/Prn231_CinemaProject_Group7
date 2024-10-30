using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.Coupons
{
    public class UpdateModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public UpdateModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public Coupon Coupon { get; set; }

        [BindProperty]
        public bool IsActive { get; set; }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            var concession = await _httpClient.GetFromJsonAsync<Coupon>($"http://localhost:5280/api/Concessions/GetCoupon/{id}");
            if (concession == null)
            {
                return NotFound();
            }

            Coupon = concession;
            IsActive = Coupon.IsActive ?? false;

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            Coupon.IsActive = IsActive;

            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Coupons/UpdateCoupon/{Coupon.CouponId}", Coupon);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while updating the concession.");
                return Page();
            }
        }
    }
}
