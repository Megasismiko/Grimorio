using AutoMapper;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.DTO;
using Grimorio.Model;

namespace Grimorio.BLL.Servicios
{
    public class MenuService : IMenuService
    {
        private readonly IGenericRepository<Usuario> _usuarioRepository;
        private readonly IGenericRepository<MenuRol> _menuRolRepository;
        private readonly IGenericRepository<Menu> _menuRepository;
        private readonly IMapper _mapper;

        public MenuService(
            IGenericRepository<Usuario> usuarioRepository, 
            IGenericRepository<MenuRol> menuRolRepository, 
            IGenericRepository<Menu> menuRepository, 
            IMapper mapper
        )
        {
            _usuarioRepository = usuarioRepository;
            _menuRolRepository = menuRolRepository;
            _menuRepository = menuRepository;
            _mapper = mapper;
        }

        public async Task<List<MenuDTO>> Lista(int idUsuario)
        {
            try
            {
                var queryUsuarios = await _usuarioRepository.Consultar(u=> u.IdUsuario == idUsuario);
                var queryMenuRol = await _menuRolRepository.Consultar();
                var queryMenu = await _menuRepository.Consultar();

                var query = (from u in queryUsuarios
                                 join mr in queryMenuRol on u.IdRol equals mr.IdRol
                                 join m in queryMenu on mr.IdMenu equals m.IdMenu
                                 select m).ToList();

                return _mapper.Map<List<MenuDTO>>(query);
            }
            catch
            {
                throw;
            }
        }
    }
}
