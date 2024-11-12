using System.ComponentModel.DataAnnotations;

namespace Prn231_CinemaProject_Group7.Models.Dtos
{
    public class LoginRequestDtos
    {
        [Required]
        [DataType(DataType.EmailAddress)]
        public string Username { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }    
    }
}
