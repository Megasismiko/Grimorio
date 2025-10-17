using AutoMapper;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.DTO;
using Grimorio.Model;

namespace Grimorio.BLL.Servicios
{
    public class SetService : ISetService
    {
        private readonly IGenericRepository<Set> _setRepository;
        private readonly IMapper _mapper;

        public SetService(IGenericRepository<Set> setRepository, IMapper mapper)
        {
            _setRepository = setRepository;
            _mapper = mapper;
        }

        public async Task<List<SetDTO>> Lista()
        {
            try
            {
                var sets = await _setRepository.Consultar();
                return _mapper.Map<List<SetDTO>>(sets.ToList());
            }
            catch
            {
                throw;
            }
        }
    }
}
