using AutoMapper;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.DTO;
using Grimorio.Model;
using Grimorio.Utility;
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
            // Validaciones básicas
            if (dto is null) throw new ValidationException("Los datos del set son obligatorios.");
            if (string.IsNullOrWhiteSpace(dto.Codigo)) throw new ValidationException("El código es obligatorio.");

            // Normalización
            var codigo = dto.Codigo.Trim().ToUpperInvariant();

            // Reglas de formato (ajusta a tus límites reales)
            if (codigo.Length > 6) throw new ValidationException("El código no puede superar 6 caracteres.");

            // Si existe previamente lo editamos y retornamos el existente
            var existe = await _setRepository.Obtener(s => s.Codigo.ToUpper() == codigo);
            if (existe is not null)
            {
                dto.IdSet = existe.IdSet;
                bool editado = await Editar(dto);
                if (!editado)
                    throw new Exception("No fue posible crear el set.");
                existe = await _setRepository.Obtener(s => s.Codigo.ToUpper() == codigo);
                return _mapper.Map<SetDTO>(existe);
            }            

            // Mapear y persistir
            var entity = _mapper.Map<Set>(dto);
            entity.Codigo = codigo;

            var creado = await _setRepository.Crear(entity);
            if (creado is null || creado.IdSet == 0)
                throw new Exception("No fue posible crear el set.");

            return _mapper.Map<SetDTO>(creado);
        }

        public async Task<bool> Editar(SetDTO dto)
        {
            if (dto is null) throw new ValidationException("Los datos del set son obligatorios.");
            if (dto.IdSet <= 0) throw new ValidationException("El Id del set es inválido.");

            var existente = await _setRepository.Obtener(s => s.IdSet == dto.IdSet);
            if (existente is null) throw new NotFoundException("El set no existe.");

            // Validar y normalizar código (si viene)
            if (!string.IsNullOrWhiteSpace(dto.Codigo))
            {
                var nuevoCodigo = dto.Codigo.Trim().ToUpperInvariant();
                if (nuevoCodigo.Length > 5) throw new ValidationException("El código no puede superar 5 caracteres.");

                // Único por código excluyendo el propio
                var duplicado = await _setRepository.Obtener(s => s.Codigo.ToUpper() == nuevoCodigo && s.IdSet != dto.IdSet);
                if (duplicado is not null)
                    throw new ConflictException($"Ya existe un Set con el código '{dto.Codigo}'.");

                dto.Codigo = nuevoCodigo;
            }

            // Mapear sobre la entidad cargada
            _mapper.Map(dto, existente);

            var ok = await _setRepository.Editar(existente);
            if (!ok) throw new Exception("Error al editar el set.");

            return ok;
        }

        public async Task<bool> Eliminar(int id)
        {
            var set = await _setRepository.Obtener(s => s.IdSet == id);
            if (set is null) throw new NotFoundException("El set no existe.");

            try
            {
                var ok = await _setRepository.Eliminar(set);
                if (!ok) throw new Exception("Error al eliminar el set.");
            }
            catch (DbUpdateException ex)
            {
                throw new ConflictException("No se puede eliminar el set por dependencias asociadas.", ex);
            }

            return true;
        }


    }
}
