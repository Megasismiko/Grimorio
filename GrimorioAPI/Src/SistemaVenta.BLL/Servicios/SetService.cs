using AutoMapper;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.DTO;
using Grimorio.Model;
using Microsoft.EntityFrameworkCore;

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

        public async Task<List<SetDTO>> GetSets()
        {
            var query = await _setRepository.Consultar();
            var sets = await query
                .Include(s => s.Cartas)
                .AsNoTracking()
                .ToListAsync();

            return _mapper.Map<List<SetDTO>>(sets);
        }

        public async Task<SetDTO?> GetSetById(int id)
        {
            var query = await _setRepository.Consultar(s => s.IdSet == id);
            var set = await query
                .Include(s => s.Cartas)
                .AsNoTracking()
                .FirstOrDefaultAsync();

            return set is null ? null : _mapper.Map<SetDTO>(set);
        }

        public async Task<SetDTO> Crear(SetDTO dto)
        {
            var entity = _mapper.Map<Set>(dto);
            var creado = await _setRepository.Crear(entity);

            if (creado is null || creado.IdSet == 0)
                throw new TaskCanceledException("No fue posible crear el set.");

            return _mapper.Map<SetDTO>(creado);
        }

        public async Task<bool> Editar(SetDTO dto)
        {
            var existente = await _setRepository.Obtener(s => s.IdSet == dto.IdSet);

            if (existente is null)
                throw new TaskCanceledException("El set no existe.");

            _mapper.Map(dto, existente);

            var result = await _setRepository.Editar(existente);
            if (!result)
                throw new TaskCanceledException("Error al editar el set.");

            return true;
        }

        public async Task<bool> Eliminar(int id)
        {
            var set = await _setRepository.Obtener(s => s.IdSet == id);

            if (set is null)
                throw new TaskCanceledException("El set no existe.");

            var result = await _setRepository.Eliminar(set);
            if (!result)
                throw new TaskCanceledException("Error al eliminar el set.");

            return true;
        }
    }
}
