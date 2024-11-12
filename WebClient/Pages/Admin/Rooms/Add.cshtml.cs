using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using System.Threading.Tasks;
using WebClient.DTO;
using WebClient.Models;  

namespace WebClient.Pages.Admin.Rooms
{
    public class AddModel : PageModel
    {
        private readonly HttpClient _httpClient;

        [BindProperty]
        public AddRoomRequestDto Room { get; set; }  // Dữ liệu phòng được bind từ form

        public List<SelectListItem> Theaters { get; set; }

        public AddModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        // Phương thức GET - để tải trang thêm phòng
        public async Task OnGetAsync()
        {
            var theaterResponse = await _httpClient.GetStringAsync("http://localhost:5280/api/Theater");
            var theaters = JsonConvert.DeserializeObject<List<TheaterDto>>(theaterResponse);

            // Chuyển danh sách thành SelectListItem cho dropdown
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

        // Phương thức POST - để xử lý khi form được submit
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();  // Nếu dữ liệu không hợp lệ, quay lại trang
            }

            // Gửi yêu cầu thêm phòng qua API
            var response = await _httpClient.PostAsJsonAsync("http://localhost:5280/api/Room", Room);

            if (response.IsSuccessStatusCode)
            {
                return RedirectToPage("/Admin/Rooms/List");  // Quay lại danh sách phòng
            }

            // Xử lý lỗi nếu có
            ModelState.AddModelError(string.Empty, "Error while adding room");
            return Page();
        }
    }
}
