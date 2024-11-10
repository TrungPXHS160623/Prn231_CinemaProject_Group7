using AutoMapper;
using Prn231_CinemaProject_Group7.DTO;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Models.Dtos.RoomDtos;
using Prn231_CinemaProject_Group7.Models.Dtos.SeatDtos;
using Prn231_CinemaProject_Group7.Models.Dtos.SeatTypeDtos;
using Prn231_CinemaProject_Group7.Models.Dtos.ShowtimeDtos;
using Prn231_CinemaProject_Group7.Models.Dtos.TheaterDtos;

namespace Prn231_CinemaProject_Group7.Mapping
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<SeatType,SeatTypeDto>().ReverseMap();
            CreateMap<AddSeatTypeRequestDto,SeatType>().ReverseMap();
            CreateMap<UpdateSeatTypeRequestDto, SeatType>().ReverseMap();

            CreateMap<Seat, SeatDto>().ReverseMap();
            CreateMap<AddSeatRequestDto,Seat>().ReverseMap();
            CreateMap<UpdateSeatRequestDto, Seat>().ReverseMap();

            CreateMap<Room,RoomDtos>().ReverseMap();
            CreateMap<AddRoomRequestDto,Room>().ReverseMap();
            CreateMap<UpdateRoomRequestDto, Room>().ReverseMap();

            CreateMap<Theater, TheaterDtocs>().ReverseMap();
            CreateMap<AddTheaterRequestDto, Theater>().ReverseMap();
            CreateMap<UpdateTheaterRequestDto, Theater>().ReverseMap();

            CreateMap<Showtime, ShowtimeDto>().ReverseMap();
            CreateMap<AddShowtimeRequestDto, Showtime>().ReverseMap();
            CreateMap<UpdateShowtimeRequest, Showtime>().ReverseMap();

            CreateMap<Order, OrderDTO>().ReverseMap();
        }
    }
}
