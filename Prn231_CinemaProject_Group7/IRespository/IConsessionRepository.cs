using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.IRespository
{
	public interface IConsessionRepository
	{
		Task<List<Concession>> GetAllConcessions();
		Task<Concession> GetConcession(int id);
		Task<bool> CreateConcession(ConcessionDTO concession);
		Task<bool> UpdateConcession(int id, ConcessionDTO concession);
		Task<bool> DeleteConcession(int id);
	}
}
