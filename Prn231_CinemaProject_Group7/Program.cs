using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Irepository;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Repository;

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
