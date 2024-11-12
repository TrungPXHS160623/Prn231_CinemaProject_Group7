using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using WebClient.DTO;  // Import DTO cho Seat
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace WebClient.Pages.Admin.Seats
{
    public class ListModel : PageModel
    {
        // Khai báo các property để chứa dữ liệu ghế
        public List<SeatDto> Seats { get; set; }
        private readonly HttpClient _httpClient;

        // Lưu trữ từ khóa tìm kiếm
        [BindProperty(SupportsGet = true)]
        public string SearchTerm { get; set; }

        // Constructor nhận HttpClient
        public ListModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        // Phương thức GET để tải danh sách ghế
        public async Task OnGetAsync()
        {
            // Lấy tất cả ghế từ API
            var response = await _httpClient.GetStringAsync("http://localhost:5280/api/Seat/all");
            var allSeats = JsonConvert.DeserializeObject<List<SeatDto>>(response);

            // Nếu có từ khóa tìm kiếm, lọc danh sách ghế theo từ khóa
            if (!string.IsNullOrEmpty(SearchTerm))
            {
                Seats = allSeats.Where(s => s.SeatNumber.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase) ||
                                             s.RowName.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase))
                                 .ToList();
            }
            else
            {
                Seats = allSeats;  // Nếu không có từ khóa tìm kiếm, hiển thị tất cả
            }
        }
    }
}
