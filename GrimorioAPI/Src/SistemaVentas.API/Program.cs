using Grimorio.IOC;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

//configurar jwt
var jwt = builder.Configuration.GetSection("Jwt");
var key = Encoding.UTF8.GetBytes(jwt["Key"]!);

// Add services to the container.
builder.Services.InyectarDependencias(builder.Configuration);

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//registrar politica de CORS en localhost
builder.Services.AddCors(options =>
{
    options.AddPolicy("local", local => local
        .AllowAnyOrigin()
        .AllowAnyHeader()
        .AllowAnyMethod()
    );
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
//usar politica de CORS en localhost
app.UseCors("local");

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
