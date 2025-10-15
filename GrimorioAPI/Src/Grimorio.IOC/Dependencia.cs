using Grimorio.DAL.DBContext;
using Grimorio.DAL.Repositorios;
using Grimorio.DAL.Repositorios.Contrato;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Grimorio.IOC
{
    public static class Dependencia
    {
        public static void InyectarDependencias(this IServiceCollection servicios, IConfiguration config)
        {
            servicios.AddDbContext<GrimorioDbContext>(options =>
            {
                options.UseSqlServer(config.GetConnectionString("GrimorioDB"));
            });

            servicios.AddTransient(typeof(IGenericRepository<>), typeof(GenericRepository<>));
            servicios.AddScoped<IVentaRepository, VentaRepository>();
        }
    }
}
