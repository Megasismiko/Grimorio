using Grimorio.DTO;

namespace Grimorio.BLL.Servicios.Contrato
{
    public interface ISetService
    {
        Task<List<SetDTO>> Lista();
        Task<SetDTO> Crear(SetDTO dto);
        Task<bool> Editar(SetDTO dto);
        Task<bool> Eliminar(int id);
    }
}
