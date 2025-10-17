using Grimorio.DTO;

namespace Grimorio.BLL.Servicios.Contrato
{
    public interface IRolService
    {
        Task<List<RolDTO>> Lista();
    }
}
