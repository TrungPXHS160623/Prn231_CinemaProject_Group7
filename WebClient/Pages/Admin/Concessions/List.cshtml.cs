using Microsoft.AspNetCore.Mvc.RazorPages;
using WebClient.Models;

namespace WebClient.Pages.Admin.Concessions
{
    public class ListModel : PageModel
    {
        private readonly HttpClient _httpClient;

        public ListModel(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public IList<Concession> Concessions { get; set; }

        public async Task OnGetAsync()
        {
            Concessions = await _httpClient.GetFromJsonAsync<IList<Concession>>("http://localhost:5280/api/Concessions/GetAllConcessions");
        }
    }
}
