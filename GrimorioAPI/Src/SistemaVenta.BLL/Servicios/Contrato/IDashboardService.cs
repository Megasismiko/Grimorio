using Grimorio.DTO;

namespace Grimorio.BLL.Servicios.Contrato
{
    public interface IDashboardService
    {
        Task<DashboardDTO> Resumen();
    }
}
