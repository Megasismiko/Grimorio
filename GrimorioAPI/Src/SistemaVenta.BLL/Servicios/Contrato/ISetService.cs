using Grimorio.DTO;

namespace Grimorio.BLL.Servicios.Contrato
{
    public interface ISetService
    {
        Task<List<SetDTO>> Lista();
    }
}
