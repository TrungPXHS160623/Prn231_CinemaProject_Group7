using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using WebClient.DTO;

namespace WebClient.Pages.Admin.Theaters
{
    public class ListModel : PageModel
    {
        public List<TheaterDto> Theaters { get; set; }
        private readonly HttpClient _httpClient;

        [BindProperty(SupportsGet = true)]
        public string SearchTerm { get; set; }  // Lưu trữ từ khóa tìm kiếm

        public ListModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        // Phương thức GET để tải danh sách rạp
        public async Task OnGetAsync()
        {
            // Lấy tất cả rạp từ API
            var response = await _httpClient.GetStringAsync("http://localhost:5280/api/Theater");
            var allTheaters = JsonConvert.DeserializeObject<List<TheaterDto>>(response);

            // Nếu có từ khóa tìm kiếm, lọc theo từ khóa
            if (!string.IsNullOrEmpty(SearchTerm))
            {
                Theaters = allTheaters
                    .Where(t => t.Name.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase) ||
                                t.Address.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase))
                    .ToList();
            }
            else
            {
                Theaters = allTheaters;  // Nếu không có tìm kiếm, hiển thị tất cả
            }
        }
    }
}