﻿namespace Prn231_CinemaProject_Group7.DTO
{
    public class CategoryDTO
    {
        public int CategoryId { get; set; }
        public string? CategoryName { get; set; } 
        public string? Description { get; set; }
        public bool? IsActive { get; set; } = true;
    }
}
