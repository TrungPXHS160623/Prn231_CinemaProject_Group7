using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models.Dtos;
using System.Security.Claims;

namespace Prn231_CinemaProject_Group7.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly UserManager<IdentityUser> userManager;
        private readonly ITokenRepository token;

        public AuthController(UserManager<IdentityUser> userManager,ITokenRepository token)
        {
            this.userManager = userManager;
            this.token = token;
        }
        [HttpPost]
        [Route("Register")]
        public async Task<IActionResult> Register([FromBody] RegisterRequestDto registerRequestDto)
        {
            var identityUser = new IdentityUser
            {
                UserName = registerRequestDto.UserName,
                Email = registerRequestDto.UserName
            };
            var identityResult = await userManager.CreateAsync(identityUser, registerRequestDto.Password);
        
            if(identityResult.Succeeded)
            {
                //add roles for this user
                if (registerRequestDto.Roles != null && registerRequestDto.Roles.Any())
                {
                    await userManager.AddToRolesAsync(identityUser, registerRequestDto.Roles);
                    if(identityResult.Succeeded)
                    {
                        return Ok("User was registerd! Please Login!!!");
                    }
                
                }
            }
            return BadRequest("Something went wrong!!!");
        }
        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login([FromBody] LoginRequestDtos loginRequestDtos)
        {
            var user = await userManager.FindByEmailAsync(loginRequestDtos.Username);
            if (user != null) { 
                var checkPasswordResult = await userManager.CheckPasswordAsync(user,loginRequestDtos.Password);
                if(checkPasswordResult)
                {
                    //get role
                    var roles = await userManager.GetRolesAsync(user);
                    if (roles != null)
                    {
                        //Create Token
                        var jwtToken =  token.CreateJWTToken(user,roles.ToList());

                        var response = new LoginResponseDto
                        {
                            JwtToken = jwtToken,
                        };
                        return Ok(response);
                    }
                    return Ok();
                }
            }
            return BadRequest("UserName or PassWord incorrect!!!");
        }
        // New endpoint to get UserId of the currently logged-in user
        [HttpGet("GetUserId")]
        [Authorize]
        public IActionResult GetUserId()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (userId == null)
                return Unauthorized("User not logged in.");

            return Ok(new { UserId = userId });
        }
        [HttpGet("GetUserRole")]
        [Authorize]
        public IActionResult GetUserRole()
        {
            var role = User.FindFirstValue(ClaimTypes.Role);
            if (role == null)
                return Unauthorized("User role not found.");

            return Ok(new { Role = role });
        }
    }
}
