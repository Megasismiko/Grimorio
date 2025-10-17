using Grimorio.DTO;

namespace Grimorio.BLL.Servicios.Contrato
{
    public interface IVentaService
    {
        Task<VentaDTO> Registrar(VentaDTO dto);
        Task<List<VentaDTO>> Historial(string buscarPor, string numeroVenta , string fechaInicio, string fechaFin);
        Task<List<ReporteDTO>> Reporte(string fechaInicio, string fechaFin);
    }
}
