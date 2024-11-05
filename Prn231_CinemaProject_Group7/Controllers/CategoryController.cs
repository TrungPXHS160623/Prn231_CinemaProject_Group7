using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryRepository _categoryRepository;
        public CategoryController(ICategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }
        [HttpGet("GetAllCategories")]
        public async Task <IActionResult> GetAllCategories()
        {
            var categories = await _categoryRepository.GetAllCategories();
            return Ok(categories);
        }
        [HttpGet("GetMovieCountByCategories")]
        public async Task<IActionResult> GetMovieCountByCategories()
        {
            var categories = await _categoryRepository.GetMovieCountByCategories();
            return Ok(categories);
        }
        [HttpGet("GetCategoryById/{id}")]
        public IActionResult GetCategory(int id)
        {
            var cate = _categoryRepository.GetCategories(id);
            if (cate == null)
            {
                return BadRequest();
            }
            else
            {
                return Ok(cate);
            }
        }
        
        [HttpPut("UpdateCategory/{id}")]
        public IActionResult UpdateCategory(int id, CategoryDTO categoryDTO)
        {
            var date = _categoryRepository.UpdateCategories(id, categoryDTO);
            if (date)
            {
                return Ok(date);
            }
            else
            { 
                return BadRequest();
            }
        }
        [HttpPut("ChangeStatus/{id}")]
        public IActionResult ChangeStatusMovie(int id)
        {
            var data = _categoryRepository.ChangeStatus(id);
            if (data)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
    }
}
