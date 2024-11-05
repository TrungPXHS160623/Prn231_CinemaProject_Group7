using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly Prn231_Project_FinalContext _context;
        public CategoryRepository(Prn231_Project_FinalContext context)
        {
            _context = context;
        }

        public bool ChangeStatus(int id)
        {
            var data = GetCategories(id);
            if (data == null)
            {
                return false;
            }
            data.IsActive = !data.IsActive;
            _context.Categories.Update(data);
            _context.SaveChanges();
            return true;
        }

        public bool CreateCategories(CategoryDTO category)
        {
            var cate = new Category()
            {
                CategoryId = category.CategoryId,
                CategoryName = category.CategoryName,
                Description = category.Description,
                IsActive = category.IsActive,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
            };
            _context.Categories.Add(cate);
            _context.SaveChanges();
            return true;
        }

        public async Task<List<Category>> GetAllCategories()
        {
            return await _context.Categories.ToListAsync();
        }
        public async Task<List<int>> GetMovieCountByCategories()
        {
            return await _context.Categories.Include(c => c.Movies).Select(c => c.Movies.Count()).ToListAsync();
        }
        public Category GetCategories(int id)
        {
            return _context.Categories.FirstOrDefault(c => c.CategoryId == id);
        }

        public bool UpdateCategories(int id, CategoryDTO category)
        {
            var data = GetCategories(id);
            if (data == null)
            {
                return false;
            }
            data.CategoryName = category.CategoryName;
            data.Description = category.Description;
            data.IsActive = category.IsActive;
            _context.Categories.Update(data);
            _context.SaveChanges();
            return true;
        }
    }
}
