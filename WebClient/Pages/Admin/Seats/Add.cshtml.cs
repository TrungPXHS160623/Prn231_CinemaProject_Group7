using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using WebClient.DTO;
using WebClient.Models;

namespace WebClient.Pages.Admin.Seats
{
    public class AddModel : PageModel
    {
        private readonly HttpClient _httpClient;

        [BindProperty]
        public AddSeatRequestDto SeatRequest { get; set; }  // Dữ liệu ghế được bind từ form

        public List<SelectListItem> RoomList { get; set; }
        public List<SelectListItem> SeatTypes { get; set; }

        public AddModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        // Phương thức GET - để tải trang thêm ghế
        public async Task OnGetAsync()
        {
            // Lấy danh sách các phòng từ API
            var roomResponse = await _httpClient.GetStringAsync("http://localhost:5280/api/Room");
            var rooms = JsonConvert.DeserializeObject<List<RoomDto>>(roomResponse);

            // Chuyển danh sách phòng thành SelectListItem cho dropdown
            RoomList = new List<SelectListItem>();
            foreach (var room in rooms)
            {
                RoomList.Add(new SelectListItem
                {
                    Value = room.RoomId.ToString(),
                    Text = room.Name,
                });
            }

            // Lấy danh sách loại ghế từ API (hoặc có thể là một danh sách tĩnh nếu cần)
            var seatTypesResponse = await _httpClient.GetStringAsync("http://localhost:5280/api/SeatType");
            var seatTypes = JsonConvert.DeserializeObject<List<SeatTypeDto>>(seatTypesResponse);

            // Chuyển danh sách loại ghế thành SelectListItem cho dropdown
            SeatTypes = new List<SelectListItem>();
            foreach (var seatType in seatTypes)
            {
                SeatTypes.Add(new SelectListItem
                {
                    Value = seatType.SeatTypeId.ToString(),
                    Text = seatType.TypeName,
                });
            }
        }

        // Phương thức POST - xử lý khi form được submit
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();  // Nếu dữ liệu không hợp lệ, quay lại trang
            }

            // Gửi yêu cầu thêm ghế qua API
            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/Seat", SeatRequest);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("/Admin/Seats/List");  // Quay lại danh sách ghế
            }

            // Xử lý lỗi nếu có
            ModelState.AddModelError(string.Empty, "Error while adding seat");
            return Page();
        }
    }
}
