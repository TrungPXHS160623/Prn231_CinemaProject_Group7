using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Net.Http;
using System.Threading.Tasks;
using WebClient.DTO;
using Newtonsoft.Json;
using System.Text;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace WebClient.Pages.Admin.Rooms
{
    public class UpdateModel : PageModel
    {
        private readonly HttpClient _httpClient;

        [BindProperty]
        public RoomDto Room { get; set; }

        public List<SelectListItem> Theaters { get; set; }

        public UpdateModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task OnGetAsync(int id)
        {
            var response = await _httpClient.GetStringAsync($"http://localhost:5280/api/Room/{id}");
            Room = JsonConvert.DeserializeObject<RoomDto>(response);

            // Lấy danh sách Theater
            var theaterResponse = await _httpClient.GetStringAsync("http://localhost:5280/api/Theater");
            var theaters = JsonConvert.DeserializeObject<List<TheaterDto>>(theaterResponse);

            // Chuyển đổi Theater thành SelectListItem
            Theaters = new List<SelectListItem>();
            foreach (var theater in theaters)
            {
                Theaters.Add(new SelectListItem
                {
                    Value = theater.TheaterId.ToString(),
                    Text = theater.Name,
                });
            }
        }

        public async Task<IActionResult> OnPostAsync()
        {
            var updateRequest = new UpdateRoomRequestDto
            {
                TheaterId = Room.TheaterId,
                Name = Room.Name,
                SeatCapacity = Room.SeatCapacity,
                IsActive = Room.IsActive
            };

            var content = new StringContent(JsonConvert.SerializeObject(updateRequest), Encoding.UTF8, "application/json");

            var response = await _httpClient.PutAsync($"http://localhost:5280/api/Room/{Room.RoomId}", content);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("/Admin/Rooms/List"); // Quay lại danh sách phòng
            }
            else
            {
                // Hiển thị lỗi nếu cập nhật không thành công
                ModelState.AddModelError(string.Empty, "Cập nhật phòng không thành công. Vui lòng thử lại.");
                return Page();
            }
        }

    }
}
