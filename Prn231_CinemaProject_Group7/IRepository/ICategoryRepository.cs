using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface ICategoryRepository
    {
        Task<List<Category>> GetAllCategories();
        Category GetCategories(int id);
        bool CreateCategories(CategoryDTO category);
        bool UpdateCategories(int id, CategoryDTO category);
        bool ChangeStatus(int id);
    }
}
