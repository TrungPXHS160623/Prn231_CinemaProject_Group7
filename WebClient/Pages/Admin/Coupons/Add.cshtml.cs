using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Prn231_CinemaProject_Group7.Models;

namespace WebClient.Pages.Admin.Coupons
{
    public class AddModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public AddModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        [BindProperty]
        public Coupon Coupon { get; set; }

        [BindProperty]
        public bool IsActive { get; set; }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            Coupon.IsActive = IsActive;

            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/Coupons/CreateCoupon", Coupon);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("./List");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "An error occurred while adding the concession.");
                return Page();
            }
        }
    }
