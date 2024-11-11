using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;
using WebClient.Models;

namespace WebClient.Pages.Cinema
{
    public class MyCoupon_GiftCardModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public MyCoupon_GiftCardModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public List<Coupon> yCoupons { get; set; }
        public List<GiftCard> yGiftCards { get; set; }
        public List<GiftCard> AvailableGiftCards { get; set; }
        [BindProperty]
        public string CouponCode { get; set; }
        [BindProperty]
        public int GiftCardId { get; set; }
        public async Task OnGetAsync(int id)
        {
            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            };
            // Process Coupons
            var couponResponse = await _httpClient.GetStringAsync($"http://localhost:5280/api/Coupons/GetCouponsByUserId/1");
            var couponJson = JsonDocument.Parse(couponResponse);
            var couponResult = couponJson.RootElement.GetProperty("result");

            if (couponResult.ValueKind == JsonValueKind.Array)
            {
                yCoupons = JsonSerializer.Deserialize<List<Coupon>>(couponResult.GetRawText(), options);
            }
            else
            {
                yCoupons = new List<Coupon> { JsonSerializer.Deserialize<Coupon>(couponResult.GetRawText(), options) };
            }

            // Process Gift Cards
            var giftCardResponse = await _httpClient.GetStringAsync($"http://localhost:5280/api/GiftCards/GetGiftCardsByUserId/1");
            var giftCardJson = JsonDocument.Parse(giftCardResponse);
            var giftCardResult = giftCardJson.RootElement.GetProperty("result");
            if (giftCardResult.ValueKind == JsonValueKind.Array)
            {
                yGiftCards = JsonSerializer.Deserialize<List<GiftCard>>(giftCardResult.GetRawText(), options);
            }
            else
            {
                yGiftCards = new List<GiftCard> { JsonSerializer.Deserialize<GiftCard>(giftCardResult.GetRawText(), options) };
            }

            AvailableGiftCards = await _httpClient.GetFromJsonAsync<List<GiftCard>>($"http://localhost:5280/api/GiftCards/GetAllGiftCards");
        }
        public async Task<IActionResult> OnPostAsync()
        {
            if(CouponCode.Length > 0)
            {
                var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Orders/UpdateOrder/{CouponCode}/1", new {});

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToPage();
                }
            }
            if (GiftCardId != 0)
            {
                var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/GiftCards/CreateGiftCardUser/{GiftCardId}/1", new {});

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToPage();
                }
            }
            return RedirectToPage();
        }
    }
}
