using Grimorio.DTO;

namespace Grimorio.BLL.Servicios.Contrato
{
    public interface ISetService
    {
        Task<List<SetDTO>> GetSets();
        Task<SetDTO?> GetSetById(int id);
        Task<SetDTO> Crear(SetDTO dto);
        Task<bool> Editar(SetDTO dto);
        Task<bool> Eliminar(int id);
     
    }
}
