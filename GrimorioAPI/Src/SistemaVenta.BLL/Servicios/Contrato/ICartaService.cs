using Grimorio.DTO;

namespace Grimorio.BLL.Servicios.Contrato
{
    public interface ICartaService
    {
        Task<List<CartaDTO>> Lista();        
        Task<CartaDTO> Crear(CartaDTO dto);
        Task<bool> Editar(CartaDTO dto);
        Task<bool> Eliminar(int id);
    }
}
