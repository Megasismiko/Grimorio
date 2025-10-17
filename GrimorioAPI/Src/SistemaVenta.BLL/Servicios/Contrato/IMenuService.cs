using Grimorio.DTO;

namespace Grimorio.BLL.Servicios.Contrato
{
    public interface IMenuService
    {
        Task<List<MenuDTO>> Lista(int idUsuario);
    }
}
