using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Prn231_CinemaProject_Group7.Repository
{
    public class SeatTypeRepository : ISeatTypeRepository
    {
        private readonly Prn231_Project_FinalContext dbContext;

        public SeatTypeRepository(Prn231_Project_FinalContext _dbContext)
        {
            dbContext = _dbContext;
        }

        public async Task<SeatType> AddSeatType(SeatType seatType)
        {
            try
            {
                if (seatType == null)
                {
                    throw new ArgumentNullException(nameof(seatType), "SeatType cannot be null.");
                }

                await dbContext.SeatTypes.AddAsync(seatType);
                await dbContext.SaveChangesAsync();
                return seatType;
            }
            catch (Exception ex)
            {
                // Log the exception here
                throw new InvalidOperationException("An error occurred while adding the seat type.", ex);
            }
        }

        public async Task<SeatType> UpdateSeatType(SeatType seatType)
        {
            try
            {
                if (seatType == null)
                {
                    throw new ArgumentNullException(nameof(seatType), "SeatType cannot be null.");
                }

                var existingSeatType = await dbContext.SeatTypes
                    .FirstOrDefaultAsync(st => st.SeatTypeId == seatType.SeatTypeId);

                if (existingSeatType == null)
                {
                    throw new KeyNotFoundException($"SeatType with ID {seatType.SeatTypeId} not found.");
                }

                // Only update if there are changes
                if (existingSeatType.TypeName != seatType.TypeName ||
                    existingSeatType.Description != seatType.Description ||
                    existingSeatType.Price != seatType.Price ||
                    existingSeatType.IsActive != seatType.IsActive)
                {
                    existingSeatType.TypeName = seatType.TypeName;
                    existingSeatType.Description = seatType.Description;
                    existingSeatType.Price = seatType.Price;
                    existingSeatType.IsActive = seatType.IsActive;

                    await dbContext.SaveChangesAsync();
                }

                return existingSeatType;
            }
            catch (Exception ex)
            {
                // Log the exception here
                throw new InvalidOperationException("An error occurred while updating the seat type.", ex);
            }
        }

        public async Task<SeatType> DeleteSeatType(int seatTypeId)
        {
            try
            {
                var seatType = await dbContext.SeatTypes
                    .FirstOrDefaultAsync(st => st.SeatTypeId == seatTypeId);

                if (seatType == null)
                {
                    throw new KeyNotFoundException($"SeatType with ID {seatTypeId} not found.");
                }

                dbContext.SeatTypes.Remove(seatType);
                await dbContext.SaveChangesAsync();

                return seatType;
            }
            catch (Exception ex)
            {
                // Log the exception here
                throw new InvalidOperationException("An error occurred while deleting the seat type.", ex);
            }
        }

        public async Task<List<SeatType>> GetActiveSeatTypes()
        {
            try
            {
                return await dbContext.SeatTypes
                    .Where(st => st.IsActive == true)
                    .ToListAsync();
            }
            catch (Exception ex)
            {
                // Log the exception here
                throw new InvalidOperationException("An error occurred while retrieving active seat types.", ex);
            }
        }

        public async Task<List<SeatType>> GetAllSeatType()
        {
            try
            {
                return await dbContext.SeatTypes.ToListAsync();
            }
            catch (Exception ex)
            {
                // Log the exception here
                throw new InvalidOperationException("An error occurred while retrieving all seat types.", ex);
            }
        }

        public async Task<SeatType> GetSeatTypeById(int seatTypeId)
        {
            try
            {
                var seatType = await dbContext.SeatTypes
                    .FirstOrDefaultAsync(st => st.SeatTypeId == seatTypeId);

                if (seatType == null)
                {
                    throw new KeyNotFoundException($"SeatType with ID {seatTypeId} not found.");
                }

                return seatType;
            }
            catch (Exception ex)
            {
                // Log the exception here
                throw new InvalidOperationException("An error occurred while retrieving the seat type by ID.", ex);
            }
        }

        public async Task<List<SeatType>> SearchSeatType(string typeName)
        {
            try
            {
                if (string.IsNullOrEmpty(typeName))
                {
                    throw new ArgumentException("Search term cannot be null or empty.", nameof(typeName));
                }

                return await dbContext.SeatTypes
                    .Where(st => st.TypeName.Contains(typeName))
                    .ToListAsync();
            }
            catch (Exception ex)
            {
                // Log the exception here
                throw new InvalidOperationException("An error occurred while searching for seat types.", ex);
            }
        }

        public async Task<SeatType?> DeActiveASeatType(int seatTypeId)
        {
            try
            {
                var seatType = await dbContext.SeatTypes
                    .FirstOrDefaultAsync(st => st.SeatTypeId == seatTypeId);

                if (seatType == null)
                {
                    throw new KeyNotFoundException($"SeatType with ID {seatTypeId} not found.");
                }

                seatType.IsActive = false;
                await dbContext.SaveChangesAsync();

                return seatType;
            }
            catch (Exception ex)
            {
                // Log the exception here
                throw new InvalidOperationException("An error occurred while deactivating the seat type.", ex);
            }
        }
    }
}
