using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using System.Diagnostics;
using WebClient.Models;
using WebClient.Pages;
using WebClient.Service;

namespace WebClient.Controller
{
    public class MomoController : ControllerBase
    {
        private readonly IMomoService _service;
        public MomoController(IMomoService service)
        {
            _service = service;
        }

        public void Index()
        {
        }
        public async void Post(OrderInfo orderInfo)
        {
        thanhtoan:
            {
                HttpClient client = new HttpClient();
                var res = await _service.CreatePaymentMomo(orderInfo);
                OpenTab(res.PayUrl);

            }
        }
        public async Task<RedirectToPageResult> Get()
        {
            return RedirectToPage("");
        }
        private void OpenTab(string url)
        {
            Process.Start(new ProcessStartInfo
            {
                FileName = url,
                UseShellExecute = true
            });
        }
    }
}
