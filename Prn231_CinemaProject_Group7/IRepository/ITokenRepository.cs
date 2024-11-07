using Microsoft.AspNetCore.Identity;

namespace Prn231_CinemaProject_Group7.IRepository
{
    public interface ITokenRepository
    {
       string CreateJWTToken(IdentityUser user, List<string> roles);

    }
}
