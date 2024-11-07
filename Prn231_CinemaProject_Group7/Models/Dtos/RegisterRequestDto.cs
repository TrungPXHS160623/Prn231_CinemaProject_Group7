using System.ComponentModel.DataAnnotations;

namespace Prn231_CinemaProject_Group7.Models.Dtos
{
    public class RegisterRequestDto
    {
        [Required]
        [DataType(DataType.EmailAddress)]
        public string UserName { get; set; }
        [Required] 
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public string[] Roles { get; set; }


    }
}
