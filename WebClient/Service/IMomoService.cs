using WebClient.Models;
using WebClient.Models.Momo;

namespace WebClient.Service
{
    public interface IMomoService
    {
        Task<MomoCreatePaymentResponseModel> CreatePaymentMomo(OrderInfo orderInfo);
        MomoExecuteResponseModel PaymentExecuteAsync(IQueryCollection collection);
    }
}
