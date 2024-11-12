using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using WebClient.Models;
using WebClient.DTO;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc;

namespace WebClient.Pages.Admin.Rooms
{
    public class ListModel : PageModel
    {
        //private readonly IHttpClientFactory _httpClientFactory;

        public List<RoomDto> Rooms { get; set; }
        private readonly HttpClient _httpClient;
        [BindProperty(SupportsGet = true)]
        public string SearchTerm { get; set; }  // Lưu trữ từ khóa tìm kiếm

        public ListModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        // Phương thức GET để tải danh sách phòng
        public async Task OnGetAsync()
        {
            // Lấy tất cả phòng từ API
            var response = await _httpClient.GetStringAsync("http://localhost:5280/api/Room");
            var allRooms = JsonConvert.DeserializeObject<List<RoomDto>>(response);

            // Nếu có từ khóa tìm kiếm, lọc theo từ khóa
            if (!string.IsNullOrEmpty(SearchTerm))
            {
                Rooms = allRooms.Where(r => r.Name.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase) ||
                                             r.TheaterName.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase))
                                 .ToList();
            }
            else
            {
                Rooms = allRooms;  // Nếu không có tìm kiếm, hiển thị tất cả
            }
        }
    }
}
