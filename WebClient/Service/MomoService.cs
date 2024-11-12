using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using RestSharp;
using System.Diagnostics;
using System.Security.Cryptography;
using System.Text;
using WebClient.Models;
using WebClient.Models.Momo;




namespace WebClient.Service
{
    public class MomoService : IMomoService
    {
        private readonly IOptions<MomoOptionModel> _options;
        public MomoService(IOptions<MomoOptionModel> options)
        {
            _options = options;
        }
        public async Task<MomoCreatePaymentResponseModel> CreatePaymentMomo(OrderInfo orderInfo)
        {
            orderInfo.OrderId = DateTime.UtcNow.Ticks.ToString();
            orderInfo.OrderInformation = "Customer: " + orderInfo.FullName + ". Content: " + orderInfo.OrderInformation;
            var rawData =
                $"partnerCode={_options.Value.PartnerCode}" +
                $"&accessKey={_options.Value.AccessKey}" +
                $"&requestId={orderInfo.OrderId}" +
                $"&amount={orderInfo.Amount}" +
                $"&orderId={orderInfo.OrderId}" +
                $"&orderInfo={orderInfo.OrderInformation}" +
                $"&returnUrl={_options.Value.ReturnUrl}" +
                $"&notifyUrl={_options.Value.NotifyUrl}" +
                $"&extraData=";

            var signature = ComputeHmacSha256(rawData, _options.Value.SecretKey);
            var client = new RestClient(_options.Value.MomoApiUrl);
            var request = new RestRequest() { Method = Method.Post };

            request.AddHeader("Content-Type", "application/json; charset=UTF-8"); var requestData = new
            {
                accessKey = _options.Value.AccessKey,
                partnerCode = _options.Value.PartnerCode,
                requestType = _options.Value.RequestType,
                notifyUrl = _options.Value.NotifyUrl,
                returnUrl = _options.Value.ReturnUrl,
                orderId = orderInfo.OrderId,
                amount = orderInfo.Amount,
                orderInfo = orderInfo.OrderInformation,
                requestId = orderInfo.OrderId,
                signature = signature,
                extraData = ""
            };
            request.AddParameter("application/json", JsonConvert.SerializeObject(requestData), ParameterType.RequestBody);
            var response = await client.ExecuteAsync(request);
            return JsonConvert.DeserializeObject<MomoCreatePaymentResponseModel>(response.Content);

        }
        public MomoExecuteResponseModel PaymentExecuteAsync(IQueryCollection collection)
        {
            var amount = collection.First(s => s.Key == "amount").Value;
            var orderInfo = collection.First(s => s.Key == "orderInfo").Value;
            var orderId = collection.First(s => s.Key == "orderId").Value;
            return new MomoExecuteResponseModel
            {
                Amount = amount,
                OrderInfo = orderInfo,
                OrderId = orderId
            };
        }
        private string ComputeHmacSha256(string message, string secretKey)
        {
            var keyBytes = Encoding.UTF8.GetBytes(secretKey);
            var messageBytes = Encoding.UTF8.GetBytes(message);
            byte[] hashBytes;
            using (var hmac = new HMACSHA256(keyBytes))
            {
                hashBytes = hmac.ComputeHash(messageBytes);
            }

            var hashString = BitConverter.ToString(hashBytes).Replace("-", "").ToLower();

            return hashString;
        }

        


    }
}
