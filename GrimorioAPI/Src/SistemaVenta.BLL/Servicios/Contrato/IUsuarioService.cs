using Grimorio.DTO;

namespace Grimorio.BLL.Servicios.Contrato
{
    public interface IUsuarioService
    {        
        Task<List<UsuarioDTO>> Lista();
        Task<SesionDTO> Login(LoginDTO login);
        Task<UsuarioDTO> Crear(UsuarioDTO dto);
        Task<bool> Editar(UsuarioDTO dto);
        Task<bool> Eliminar(int id);
    }
}
