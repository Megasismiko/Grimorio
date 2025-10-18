using Grimorio.BLL.Servicios;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.DBContext;
using Grimorio.DAL.Repositorios;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.Utility;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace Grimorio.IOC
{
    public static class Dependencia
    {
        public static void InyectarDependencias(this IServiceCollection servicios, IConfiguration config)
        {
            // CONTEXT DAL
            servicios.AddDbContext<GrimorioDbContext>(options =>
            {
                options.UseSqlServer(config.GetConnectionString("GrimorioDB"));
            });

            // REPOS DAL
            servicios.AddTransient(typeof(IGenericRepository<>), typeof(GenericRepository<>));
            servicios.AddScoped<IVentaRepository, VentaRepository>();

            // PROFILE MAPPER 
            servicios.AddAutoMapper(typeof(AutoMapperProfile));

            // SERVICES BLL
            servicios.AddScoped<IRolService, RolService>();
            servicios.AddScoped<IUsuarioService, UsuarioService>();
            servicios.AddScoped<ISetService, SetService>();
            servicios.AddScoped<ICartaService, CartaService>();
            servicios.AddScoped<IVentaService, VentaService>();
            servicios.AddScoped<IDashboardService, DashboardService>();
            servicios.AddScoped<IMenuService, MenuService>();

            //Auth
            servicios.AddJwtAuth(config);
        }

        public static IServiceCollection AddJwtAuth(this IServiceCollection services, IConfiguration config)
        {
            // Bind a opciones fuertemente tipadas (opcional)
            services.Configure<JwtOptions>(config.GetSection("Jwt"));

            var jwt = config.GetSection("Jwt");
            var keyBytes = Encoding.UTF8.GetBytes(jwt["Key"]!);

            services
                .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(opt =>
                {
                    opt.TokenValidationParameters = new()
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        ValidIssuer = jwt["Issuer"],
                        ValidAudience = jwt["Audience"],
                        IssuerSigningKey = new SymmetricSecurityKey(keyBytes),
                        ClockSkew = TimeSpan.Zero
                    };
                });

            services.AddAuthorization();

            return services;
        }
    }
}
