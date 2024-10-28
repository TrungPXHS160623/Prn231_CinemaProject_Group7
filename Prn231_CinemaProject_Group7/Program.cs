using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.IRespository;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Repository;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddDbContext<PRN231_CinemaContext>(opt =>
{
	opt.UseSqlServer(builder.Configuration.GetConnectionString("MyDatabase"));
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IConsessionRepository, ConcessionRepository>();
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
