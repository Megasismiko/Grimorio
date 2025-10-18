using AutoMapper;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.DTO;
using Grimorio.Model;
using Microsoft.EntityFrameworkCore;


namespace Grimorio.BLL.Servicios
{
    public class UsuarioService : IUsuarioService
    {
        private readonly IGenericRepository<Usuario> _usuarioRepository;
        private readonly IMapper _mapper;

        public UsuarioService(IGenericRepository<Usuario> usuarioRepository, IMapper mapper)
        {
            _usuarioRepository = usuarioRepository;
            _mapper = mapper;
        }

        public async Task<List<UsuarioDTO>> Lista()
        {
            try
            {
                var query = await _usuarioRepository.Consultar();
                var usuarios = query.Include(rol => rol.IdRolNavigation).ToList();
                return _mapper.Map<List<UsuarioDTO>>(usuarios);
            }
            catch
            {
                throw;
            }
        }

        public async Task<SesionDTO> Login(LoginDTO login)
        {
            try
            {
                var query = await _usuarioRepository.Consultar(usuario =>
                    usuario.Correo.ToLower() == login.Correo.ToLower()
                    && usuario.Clave == login.Clave
                );

                if (!query.Any()) throw new TaskCanceledException("El usurio no existe");

                Usuario usuario = query.Include(rol => rol.IdRolNavigation).First();

                return _mapper.Map<SesionDTO>(usuario);
            }
            catch
            {
                throw;
            }
        }

        public async Task<UsuarioDTO> Crear(UsuarioDTO dto)
        {
            try
            {
                var usuario = await _usuarioRepository.Crear(_mapper.Map<Usuario>(dto));

                if (usuario.IdUsuario == 0)
                    throw new TaskCanceledException("No es posible crear el usuario");

                var query = await _usuarioRepository.Consultar(u => u.IdUsuario == usuario.IdUsuario);

                usuario = query.Include(rol => rol.IdRolNavigation).First();

                return _mapper.Map<UsuarioDTO>(usuario);
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> Editar(UsuarioDTO dto)
        {
            try
            {
                var usuario = _mapper.Map<Usuario>(dto);
                var usuarioExistente = await _usuarioRepository.Obtener(u => u.IdUsuario == usuario.IdUsuario);

                if(usuarioExistente == null)
                    throw new TaskCanceledException("El usuario no existe");

                usuarioExistente.NombreCompleto = usuario.NombreCompleto;
                usuarioExistente.Correo  = usuario.Correo;
                usuarioExistente.IdRol  = usuario.IdRol;
                usuarioExistente.Clave = usuario.Clave;
                usuarioExistente.EsActivo = usuario.EsActivo;

                bool result = await _usuarioRepository.Editar(usuarioExistente);
                if (!result)
                    throw new TaskCanceledException("Error al editar el usuario");

                return result;
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> Eliminar(int id)
        {
            try
            {
                var usuarioExistente = await _usuarioRepository.Obtener(u => u.IdUsuario == id);

                  if (usuarioExistente == null)
                    throw new TaskCanceledException("El usuario no existe");

                bool result = await _usuarioRepository.Eliminar(usuarioExistente);

                if (!result)
                    throw new TaskCanceledException("Error al eliminar el usuario");

                return result;
            }
            catch
            {
                throw;
            }
        }
    }
}
