using Grimorio.DTO;

namespace Grimorio.BLL.Servicios.Contrato
{
    public interface ICartaService
    {
        Task<CartaDTO?> GetCartaById(int id);      
        Task<CartaDTO> Crear(CartaDTO dto);
        Task<bool> Editar(CartaDTO dto);
        Task<bool> Eliminar(int id);
        Task<bool> CrearLote(List<CartaDTO> cartas);
    }
}
