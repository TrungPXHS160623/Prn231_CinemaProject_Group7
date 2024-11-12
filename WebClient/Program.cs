using WebClient.Models.Momo;
using WebClient.Service;

var builder = WebApplication.CreateBuilder(args);

builder.Services.Configure<MomoOptionModel>(builder.Configuration.GetSection("MomoAPI"));
builder.Services.AddScoped<IMomoService, MomoService>();

builder.Services.AddRazorPages();
builder.Services.AddHttpClient();
var app = builder.Build();
app.MapRazorPages();
app.UseStaticFiles();
app.Run();
