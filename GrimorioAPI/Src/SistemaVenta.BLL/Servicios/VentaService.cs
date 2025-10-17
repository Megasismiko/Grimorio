using AutoMapper;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.DTO;
using Grimorio.Model;
using Grimorio.Utility;
using Microsoft.EntityFrameworkCore;

namespace Grimorio.BLL.Servicios
{
    public class VentaService : IVentaService
    {
        private readonly IGenericRepository<DetalleVenta> _ventaDetalleRepository;
        private readonly IVentaRepository _ventaRepository;
        private readonly IMapper _mapper;

        public VentaService(
            IGenericRepository<DetalleVenta> ventaDetalleRepository,
            IVentaRepository ventaRepository,
            IMapper mapper
        )
        {
            _ventaDetalleRepository = ventaDetalleRepository;
            _ventaRepository = ventaRepository;
            _mapper = mapper;
        }

        public async Task<VentaDTO> Registrar(VentaDTO dto)
        {
            try
            {
                var venta = await _ventaRepository.Registrar(_mapper.Map<Venta>(dto));

                if (venta.IdVenta == 0)
                    throw new TaskCanceledException("Error al crear la venta");

                return _mapper.Map<VentaDTO>(venta);
            }
            catch
            {
                throw;
            }
        }

        public async Task<List<VentaDTO>> Historial(string buscarPor, string numeroVenta, string fechaInicio, string fechaFin)
        {
            try
            {
                var query = await _ventaRepository.Consultar();

                switch (buscarPor)
                {
                    case "fecha":
                        DateTime _fechaInicio = DateTime.ParseExact(fechaInicio, Culture.FormatoFecha, Culture.Current);
                        DateTime _fechaFin = DateTime.ParseExact(fechaFin, Culture.FormatoFecha, Culture.Current);
                        query = query.Where(v => 
                            v.FechaRegistro.Value.Date >= _fechaInicio.Date
                            && v.FechaRegistro.Value.Date <= _fechaFin.Date
                        );
                        break;
                    case "numeroDocumento":
                        query = query.Where(v => v.NumeroDocumento == numeroVenta);
                        break;
                }

                var ventas = await query
                    .Include(dv => dv.DetalleVenta)
                    .ThenInclude(c => c.IdCartaNavigation)
                    .ToListAsync();

                return _mapper.Map<List<VentaDTO>>(ventas);
            }
            catch
            {
                throw;
            }
        }



        public async Task<List<ReporteDTO>> Reporte(string fechaInicio, string fechaFin)
        {
            try
            {
                var query = await _ventaDetalleRepository.Consultar();

                DateTime _fechaInicio = DateTime.ParseExact(fechaInicio, Culture.FormatoFecha, Culture.Current);
                DateTime _fechaFin = DateTime.ParseExact(fechaFin, Culture.FormatoFecha, Culture.Current);
                var ventas = query.Where(vd =>
                    vd.IdVentaNavigation.FechaRegistro.Value.Date >= _fechaInicio.Date
                    && vd.IdVentaNavigation.FechaRegistro.Value.Date <= _fechaFin.Date
                ).Include(c => c.IdCartaNavigation)
                 .Include(v => v.IdVentaNavigation);

                return _mapper.Map<List<ReporteDTO>>(ventas);
            }
            catch
            {
                throw;
            }
        }
    }
}
