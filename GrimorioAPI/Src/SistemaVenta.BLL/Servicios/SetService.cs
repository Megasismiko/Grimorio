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

        public async Task<SetDTO> Crear(SetDTO dto)
        {
            try
            {
                var set = await _setRepository.Crear(_mapper.Map<Set>(dto));

                if (set.IdSet == 0)
                    throw new TaskCanceledException("No es posible crear el set");

                var query = await _setRepository.Consultar(u => u.IdSet == set.IdSet);

                set = query.First();

                return _mapper.Map<SetDTO>(set);
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> Editar(SetDTO dto)
        {
            try
            {
                var set = _mapper.Map<Set>(dto);
                var setExistente = await _setRepository.Obtener(u => u.IdSet == set.IdSet);

                if (setExistente == null)
                    throw new TaskCanceledException("La carta no existe");

                setExistente.Nombre = set.Nombre;
                setExistente.Codigo = set.Codigo;
                setExistente.Logo = set.Logo;
                setExistente.Color = set.Color;
                setExistente.FechaSalida = set.FechaSalida;
                setExistente.EsActivo = set.EsActivo;

                bool result = await _setRepository.Editar(setExistente);

                if (!result)
                    throw new TaskCanceledException("Error al editar el set");

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
                var carta = await _setRepository.Obtener(u => u.IdSet == id);

                if (carta == null)
                    throw new TaskCanceledException("La carta no existe");

                bool result = await _setRepository.Eliminar(carta);

                if (!result)
                    throw new TaskCanceledException("Error al eliminar el ser");

                return result;
            }
            catch
            {
                throw;
            }
        }
    }
}
