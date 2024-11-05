using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Irepository;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Repository;
using Prn231_CinemaProject_Group7.Mapping;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddDbContext<Prn231_Project_FinalContext>(opt =>
{
	opt.UseSqlServer(builder.Configuration.GetConnectionString("MyDatabase"));
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IConsessionRepository, ConcessionRepository>();
builder.Services.AddScoped<ICouponRepository, CouponRepository>();
builder.Services.AddScoped<IOrderRepository, OrderRepository>();
builder.Services.AddScoped<IGiftCardRepository, GiftCardRepository>();
builder.Services.AddScoped<INewsRepository, NewsRepository>();
builder.Services.AddScoped<ISeatTypeRepository, SeatTypeRepository>();
builder.Services.AddScoped<ISeatRepository, SeatRepository>();
builder.Services.AddScoped<IRoomRepository, RoomRepository>();
builder.Services.AddScoped<ITheaterRepository, TheaterRepository>();

builder.Services.AddAutoMapper(typeof(AutoMapperProfile));
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IMovieRepository, MovieRepository>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();
