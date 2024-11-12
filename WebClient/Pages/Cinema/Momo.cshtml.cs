using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;
using WebClient.Service;

namespace WebClient.Pages.Cinema
{
    public class MomoModel : PageModel
    {
        private readonly IMomoService _momoService;
        public MomoModel()
        {

        }
        public MomoModel(IMomoService momoService)
        {
            _momoService = momoService;
        }

        public void OnGet()
        {

        }
        public async Task<RedirectResult> OnPost(Order order, OrderInfo orderInfo)
        {
        thanhtoan:
            {
                var res = await _momoService.CreatePaymentMomo(orderInfo);
                return Redirect(res.PayUrl);

            }
        }
    }
}
