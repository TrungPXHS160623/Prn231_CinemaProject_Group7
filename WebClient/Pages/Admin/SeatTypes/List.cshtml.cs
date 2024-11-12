using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using WebClient.DTO;

namespace WebClient.Pages.Admin.SeatTypes
{
    public class ListModel : PageModel
    {
        public List<SeatTypeDto> SeatTypes { get; set; }
        private readonly HttpClient _httpClient;

        [BindProperty(SupportsGet = true)]
        public string SearchTerm { get; set; }  // Lưu trữ từ khóa tìm kiếm

        public ListModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        // Phương thức GET để tải danh sách loại ghế
        public async Task OnGetAsync()
        {
            // Lấy tất cả loại ghế từ API
            var response = await _httpClient.GetStringAsync("http://localhost:5280/api/SeatType");
            var allSeatTypes = JsonConvert.DeserializeObject<List<SeatTypeDto>>(response);

            // Nếu có từ khóa tìm kiếm, lọc theo từ khóa
            if (!string.IsNullOrEmpty(SearchTerm))
            {
                SeatTypes = allSeatTypes
                    .Where(s => s.TypeName.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase) ||
                                (s.Description != null && s.Description.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase)))
                    .ToList();
            }
            else
            {
                SeatTypes = allSeatTypes;  // Nếu không có tìm kiếm, hiển thị tất cả
            }
        }
    }
}
