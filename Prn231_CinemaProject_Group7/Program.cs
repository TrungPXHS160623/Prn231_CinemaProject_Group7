using Microsoft.EntityFrameworkCore;
using Prn231_CinemaProject_Group7.IRepository;
using Prn231_CinemaProject_Group7.Irepository;
using Prn231_CinemaProject_Group7.Models;
using Prn231_CinemaProject_Group7.Repository;
using Prn231_CinemaProject_Group7.Mapping;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Prn231_CinemaProject_Group7.Models.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddDbContext<Prn231_Project_FinalContext>(opt =>
{
	opt.UseSqlServer(builder.Configuration.GetConnectionString("MyDatabase"));
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
//builder.Services.AddSwaggerGen();
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new OpenApiInfo { Title = "CinemaApi", Version = "v1" });
    options.AddSecurityDefinition(JwtBearerDefaults.AuthenticationScheme, new OpenApiSecurityScheme
    {
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey,
        Scheme = JwtBearerDefaults.AuthenticationScheme
    });
    options.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = JwtBearerDefaults.AuthenticationScheme
                },
                Scheme="Ouath2",
                Name = JwtBearerDefaults.AuthenticationScheme,
                In = ParameterLocation.Header,
            },
            new List<string>()
        }
    });
});
builder.Services.AddScoped<IConsessionRepository, ConcessionRepository>();
builder.Services.AddScoped<ICouponRepository, CouponRepository>();
builder.Services.AddScoped<IOrderRepository, OrderRepository>();
builder.Services.AddScoped<IGiftCardRepository, GiftCardRepository>();
builder.Services.AddScoped<INewsRepository, NewsRepository>();
builder.Services.AddScoped<ISeatTypeRepository, SeatTypeRepository>();
builder.Services.AddScoped<ISeatRepository, SeatRepository>();
builder.Services.AddScoped<IRoomRepository, RoomRepository>();
builder.Services.AddScoped<ITheaterRepository, TheaterRepository>();
builder.Services.AddScoped<IShowtimeRepository, ShowtimeRepository>();

builder.Services.AddAutoMapper(typeof(AutoMapperProfile));
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IMovieRepository, MovieRepository>();
builder.Services.AddDbContext<CinemaAuthDbContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("CinemaAuthConnectionString")));

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer
    (options => options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
    });
builder.Services.AddIdentityCore<IdentityUser>()
    .AddRoles<IdentityRole>()
    .AddTokenProvider<DataProtectorTokenProvider<IdentityUser>>("Cinema")
    .AddEntityFrameworkStores<CinemaAuthDbContext>()
    .AddDefaultTokenProviders();

builder.Services.Configure<IdentityOptions>(options =>
{
    options.Password.RequireDigit = false;
    options.Password.RequireLowercase = false;
    options.Password.RequireNonAlphanumeric = false;
    options.Password.RequireUppercase = false;
    options.Password.RequiredLength = 8;
    options.Password.RequiredUniqueChars = 1;
});
builder.Services.AddScoped<ITokenRepository, TokenRepository>();


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.Run();
