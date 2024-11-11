using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.IRepository;
using System.Collections.Generic;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private readonly IMovieRepository repository;
        public MovieController(IMovieRepository repository)
        {
            this.repository = repository;
        }
        [HttpGet("GetAllMovies")]
        public async Task<IActionResult> GetallMovies()
        {
            return Ok(await repository.GetAllMovies());
        }
<<<<<<< Updated upstream
=======

        [HttpGet("GetMovieByTheater/{theaterId}")]
        public async Task<IActionResult> GetMovieByTheater(int theaterId)
        {
            return Ok(await repository.GetMovieByTheater(theaterId));
        }
>>>>>>> Stashed changes
        [HttpGet("GetMovie/{id}")]
        public IActionResult GetMovie(int id)
        {
            return Ok(repository.GetMovies(id));
        }
        [HttpPut("UpdateMovie/{id}")]
        public IActionResult UpdateMovie(int id, MovieDTO movieDTO)
        {
            var data = repository.UpdateMovies(id, movieDTO);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("ChangeStatus/{id}")]
        public IActionResult ChangeStatusMovie(int id)
        {
            var data = repository.ChangeStatus(id);
            if (data.Result)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("UpdateCategory/{id}")]
        public IActionResult UpdateCategory(int id, List<int> list)
        {
            var rs = repository.EditCategories(id, list);
            if (rs.Result)
            {
                return Ok("ok");
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut("AddMovie")]
        public IActionResult AddNewMovie(MovieDTO movieDTO)
        {
            var rs = repository.CreateMovies(movieDTO);
            if (rs.Result)
            {
                return Ok("ok");
            }
            else
            {
                return BadRequest();
            }
        }
    }
}
