using AutoMapper;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.DTO;
using Grimorio.Model;
using Grimorio.Utility;

namespace Grimorio.BLL.Servicios
{
    public class DashboardService : IDashboardService
    {
        private readonly IVentaRepository _ventaRepository;
        private readonly IGenericRepository<Carta> _cartaRepository;
        private readonly IMapper _mapper;

        public DashboardService(IVentaRepository ventaRepository, IGenericRepository<Carta> cartaRepository, IMapper mapper)
        {
            _ventaRepository = ventaRepository;
            _cartaRepository = cartaRepository;
            _mapper = mapper;
        }

        private IQueryable<Venta> RetornarVentas(IQueryable<Venta> ventas, int dias)
        {
            DateTime? ultimaFecha = ventas.OrderByDescending(v => v.FechaRegistro).Select(v => v.FechaRegistro).FirstOrDefault();

            ultimaFecha = ultimaFecha.Value.AddDays(dias);

            return ventas.Where(v => v.FechaRegistro.Value.Date >= ultimaFecha.Value.Date);
        }

        private async Task<int> TotalVentasUltimaSemana()
        {
            int total = 0;
            var query = await _ventaRepository.Consultar();
            if (query.Any())
            {
                var ventas = RetornarVentas(query, -7);
                total = ventas.Count();
            }

            return total;
        }

        private async Task<string> TotalIngresosUltimaSemana()
        {
            decimal total = 0;
            var query = await _ventaRepository.Consultar();
            if (query.Any())
            {
                var ventas = RetornarVentas(query, -7);
                total = ventas.Sum(v => v.Total.Value);
            }

            return Convert.ToString(total, Culture.Current);
        }

        private async Task<int> TotalCartas()
        {
            var query = await _cartaRepository.Consultar();
            int total = query.Count();
            return total;
        }


        private async Task<Dictionary<string, int>> VentasUltimaSemana()
        {
            Dictionary<string, int> resultado = [];

            var query = await _ventaRepository.Consultar();

            if (query.Any())
            {
                var ventas = RetornarVentas(query, -7);

                resultado = ventas
                    .GroupBy(v => v.FechaRegistro.Value.Date)
                    .OrderBy(v => v.Key)
                    .ToDictionary(
                        v => v.Key.ToString(Culture.FormatoFecha),
                        v => v.Count()
                    );
            }

            return resultado;
        }


        public async Task<DashboardDTO> Resumen()
        {
            try
            {
                var dashboard = new DashboardDTO()
                {
                    TotalVentas = await TotalVentasUltimaSemana(),
                    TotalIngresos = await TotalIngresosUltimaSemana(),
                    TotalProductos = await TotalCartas()
                };

                var ventasSemana = await VentasUltimaSemana();

                foreach (var ventaDia in ventasSemana)
                {
                    dashboard.VentasUltimaSemana.Add(new VentasSemanaDTO()
                    {
                        Fecha = ventaDia.Key,
                        Total = ventaDia.Value
                    });
                }
                return dashboard;
            }
            catch
            {
                throw;
            }
        }
    }
}
