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

            // Único por código
            var existe = await _setRepository.Obtener(s => s.Codigo.ToUpper() == codigo);
            if (existe is not null)
                throw new ConflictException($"Ya existe un Set con el código '{dto.Codigo}'.");

            // Mapear y persistir
            var entity = _mapper.Map<Set>(dto);
            entity.Codigo = codigo;

            var creado = await _setRepository.Crear(entity);
            if (creado is null || creado.IdSet == 0)
                throw new Exception("No fue posible crear el set.");

            return _mapper.Map<SetDTO>(creado);
        }

        public async Task<bool> CrearLote(List<SetDTO> sets)
        {
            if (sets is null || sets.Count == 0)
                throw new ValidationException("Debes enviar al menos un set.");

            // 1) Normalizar + validar
            var normalizados = sets
                .Where(s => s is not null)
                .Select(s => new
                {
                    Dto = s,
                    Codigo = (s.Codigo ?? string.Empty).Trim().ToUpperInvariant()
                })
                .Where(x => !string.IsNullOrWhiteSpace(x.Codigo))
                .ToList();

            if (normalizados.Count == 0)
                throw new ValidationException("Todos los elementos carecen de código válido.");

            foreach (var x in normalizados)
                if (x.Codigo.Length > 6)
                    throw new ValidationException($"El código '{x.Codigo}' supera el máximo de 6 caracteres.");

            // 2) De-dup en memoria por Codigo (quedarse con el primero)
            var unicos = normalizados
                .GroupBy(x => x.Codigo)
                .Select(g => g.First())
                .ToList();

            // 3) Detectar existentes de una vez (usa tu método Listar si lo tienes)
            //    Si no dispones de Listar(filtro), ver bloque alternativo más abajo.
            var codigos = unicos.Select(x => x.Codigo).ToList();
            var existentes = await _setRepository.Consultar(s => codigos.Contains(s.Codigo.ToUpper()));
            var existentesSet = existentes.Select(e => e.Codigo.ToUpper()).ToHashSet();

            // 4) Preparar candidatos a crear
            var candidatos = unicos
                .Where(x => !existentesSet.Contains(x.Codigo))
                .Select(x =>
                {
                    var entity = _mapper.Map<Set>(x.Dto);
                    entity.Codigo = x.Codigo; // usar normalizado
                    return entity;
                })
                .ToList();

            if (candidatos.Count == 0) return true; // nada que crear

            // 5) Crear uno a uno (secuencial)
            var creados = 0;
            foreach (var entity in candidatos)
            {
                var creado = await _setRepository.Crear(entity);
                if (creado is not null && creado.IdSet > 0) creados++;
            }

            return creados == candidatos.Count;
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
