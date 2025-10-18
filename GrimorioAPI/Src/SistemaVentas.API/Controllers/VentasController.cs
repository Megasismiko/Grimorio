using Grimorio.API.Utilidad;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DTO;
using Microsoft.AspNetCore.Mvc;

namespace Grimorio.API.Controllers
{
    [Route("api/ventas")]
    [ApiController]
    public class VentasController : ControllerBase
    {
        private readonly IVentaService _ventaService;

        public VentasController(IVentaService ventaService)
        {
            _ventaService = ventaService;
        }

        [HttpPost]
        [Route("crear")]
        public async Task<IActionResult> Crear([FromBody] VentaDTO venta)
        {
            Response<VentaDTO> res = new();

            try
            {
                res.value = await _ventaService.Registrar(venta);
            }
            catch (Exception ex)
            {
                res.status = false;
                res.msg = ex.Message;
            }

            return Ok(res);
        }


        [HttpGet]
        [Route("historial")]
        public async Task<IActionResult> Historial(string buscarPor, string? numeroVenta, string? fechaInicio, string? fechaFin)
        {
            Response<List<VentaDTO>> res = new();

            numeroVenta = numeroVenta is null ? string.Empty : numeroVenta;
            fechaInicio = fechaInicio is null ? string.Empty : fechaInicio;
            fechaFin = fechaFin is null ? string.Empty : fechaFin;

            try
            {
                res.value = await _ventaService.Historial(buscarPor, numeroVenta, fechaInicio, fechaFin);
            }
            catch (Exception ex)
            {
                res.status = false;
                res.msg = ex.Message;
            }

            return Ok(res);
        }

        [HttpGet]
        [Route("reporte")]
        public async Task<IActionResult> Reporte(string? fechaInicio, string? fechaFin)
        {
            Response<List<ReporteDTO>> res = new();     
            
            fechaInicio = fechaInicio is null ? string.Empty : fechaInicio;
            fechaFin = fechaFin is null ? string.Empty : fechaFin;

            try
            {
                res.value = await _ventaService.Reporte(fechaInicio, fechaFin);
            }
            catch (Exception ex)
            {
                res.status = false;
                res.msg = ex.Message;
            }

            return Ok(res);
        }
    }
}
