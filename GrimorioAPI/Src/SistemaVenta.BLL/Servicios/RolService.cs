using AutoMapper;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.DTO;
using Grimorio.Model;

namespace Grimorio.BLL.Servicios
{
    public class RolService : IRolService
    {
        private readonly IGenericRepository<Rol> _rolRepository;
        private readonly IMapper _mapper;

        public RolService(IGenericRepository<Rol> rolRepository, IMapper mapper)
        {
            _rolRepository = rolRepository;
            _mapper = mapper;
        }

        public async Task<List<RolDTO>> Lista()
        {
            try
            {
                var roles = await _rolRepository.Consultar();
                return _mapper.Map<List<RolDTO>>(roles.ToList());
            }
            catch
            {
                throw;
            }
        }
    }
}
