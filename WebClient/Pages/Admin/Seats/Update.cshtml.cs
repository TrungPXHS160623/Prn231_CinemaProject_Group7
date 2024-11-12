using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using WebClient.DTO;

namespace WebClient.Pages.Admin.Seats
{
    public class UpdateModel : PageModel
    {
        private readonly HttpClient _httpClient;

        [BindProperty]
        public SeatDto SeatRequest { get; set; }

        public List<SelectListItem> RoomList { get; set; }
        public List<SelectListItem> SeatTypes { get; set; }

        public UpdateModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        // OnGetAsync để tải dữ liệu ghế và các danh sách lựa chọn
        public async Task<IActionResult> OnGetAsync(int id)
        {
            // Lấy danh sách phòng và loại ghế từ API
            var roomResponse = await _httpClient.GetStringAsync("http://localhost:5280/api/Room");
            var rooms = JsonConvert.DeserializeObject<List<RoomDto>>(roomResponse);
            RoomList = new List<SelectListItem>();
            foreach (var room in rooms)
            {
                RoomList.Add(new SelectListItem
                {
                    Value = room.RoomId.ToString(),
                    Text = room.Name
                });
            }

            var seatTypeResponse = await _httpClient.GetStringAsync("http://localhost:5280/api/SeatType");
            var seatTypes = JsonConvert.DeserializeObject<List<SeatTypeDto>>(seatTypeResponse);
            SeatTypes = new List<SelectListItem>();
            foreach (var seatType in seatTypes)
            {
                SeatTypes.Add(new SelectListItem
                {
                    Value = seatType.SeatTypeId.ToString(),
                    Text = seatType.TypeName
                });
            }

            // Lấy dữ liệu ghế từ API
            var seatResponse = await _httpClient.GetStringAsync($"http://localhost:5280/api/Seat/{id}");
            var seat = JsonConvert.DeserializeObject<SeatDto>(seatResponse);
            if (seat == null)
            {
                return NotFound();
            }

            SeatRequest = seat;

            return Page();
        }

        // OnPostAsync để cập nhật dữ liệu ghế
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();  // Nếu dữ liệu không hợp lệ, quay lại trang
            }

            var response = await _httpClient.PutAsJsonAsync($"http://localhost:5280/api/Seat/{SeatRequest.SeatNumber}", SeatRequest);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("/Admin/Seats/List");  // Quay lại danh sách ghế
            }

            ModelState.AddModelError(string.Empty, "Error while updating seat");
            return Page();
        }
    }
}
