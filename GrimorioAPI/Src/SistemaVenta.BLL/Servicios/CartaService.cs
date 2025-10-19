using AutoMapper;
using AutoMapper.QueryableExtensions;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.DTO;
using Grimorio.Model;
using Grimorio.Utility;
using Microsoft.EntityFrameworkCore;

namespace Grimorio.BLL.Servicios
{
    public class CartaService : ICartaService
    {
        private readonly IGenericRepository<Carta> _cartaRepository;
        private readonly IGenericRepository<Set> _setRepository;    
        private readonly IMapper _mapper;

        public CartaService(
            IGenericRepository<Carta> cartaRepository,
            IGenericRepository<Set> setRepository,
            IMapper mapper)
        {
            _cartaRepository = cartaRepository;
            _setRepository = setRepository;
            _mapper = mapper;
        }

        public async Task<CartaDTO?> GetCartaById(int id)
        {
            var query = await _cartaRepository.Consultar(c => c.IdCarta == id);

            return await query
                .AsNoTracking()
                .ProjectTo<CartaDTO>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync();
        }

        public async Task<CartaDTO> Crear(CartaDTO dto)
        {
            if (dto is null) throw new ValidationException("Los datos de la carta son obligatorios.");
            if (dto.IdSet <= 0) throw new ValidationException("El Id del set es obligatorio.");
            if (string.IsNullOrWhiteSpace(dto.Nombre)) throw new ValidationException("El nombre es obligatorio.");
            if (dto.Stock is < 0) throw new ValidationException("El stock no puede ser negativo.");
            if (string.IsNullOrWhiteSpace(dto.Numero))
                throw new ValidationException("El número de colección es obligatorio para distinguir impresiones.");

            // Validar FK Set
            var set = await _setRepository.Obtener(s => s.IdSet == dto.IdSet);
            if (set is null) throw new NotFoundException("El set asociado no existe.");

            // Normalizaciones
            dto.Nombre = dto.Nombre.Trim();
            dto.Rareza = dto.Rareza?.Trim();
            dto.Tipo = dto.Tipo?.Trim();
            dto.ImagenUrl = dto.ImagenUrl?.Trim();
            var numeroKey = dto.Numero.Trim().ToUpperInvariant();

            // Unicidad por (IdSet, Numero)
            var duplicado = await _cartaRepository.Obtener(c =>
                c.IdSet == dto.IdSet &&
                c.Numero.ToUpper() == numeroKey);

            if (duplicado is not null)
                throw new ConflictException($"Ya existe la carta con número '{dto.Numero}' en este set.");

            // Crear
            var carta = _mapper.Map<Carta>(dto);
            carta.Numero = numeroKey; // guarda normalizado

            var cartaCreada = await _cartaRepository.Crear(carta);
            if (cartaCreada is null || cartaCreada.IdCarta == 0)
                throw new Exception("No fue posible crear la carta.");

            return _mapper.Map<CartaDTO>(cartaCreada);
        }


        public async Task<bool> CrearLote(List<CartaDTO> cartas)
        {
            if (cartas is null || cartas.Count == 0)
                throw new ValidationException("Debes enviar al menos una carta.");

            // 1) Normalizar datos base
            var normalizadas = cartas
                .Where(c => c is not null)
                .Select(c => new
                {
                    Dto = c,
                    IdSet = c.IdSet,
                    Nombre = (c.Nombre ?? string.Empty).Trim(),
                    Numero = (c.Numero ?? string.Empty).Trim(),
                    NumeroKey = (c.Numero ?? string.Empty).Trim().ToUpperInvariant(),
                    Rareza = c.Rareza?.Trim(),
                    Tipo = c.Tipo?.Trim(),
                    ImagenUrl = c.ImagenUrl?.Trim(),
                    Stock = c.Stock
                })
                .ToList();

            // 2) Verificar que todo el lote va al MISMO set (>0)
            var distinctSetIds = normalizadas.Select(x => x.IdSet).Where(id => id > 0).Distinct().ToList();
            if (distinctSetIds.Count != 1)
                throw new ValidationException("Todas las cartas del lote deben pertenecer al mismo Set.");
            var setId = distinctSetIds[0];

            // 3) Validaciones por carta
            var errores = new List<string>();
            foreach (var x in normalizadas)
            {
                if (x.IdSet != setId) errores.Add($"Carta con IdSet inconsistente (Nombre='{x.Nombre}').");
                if (string.IsNullOrWhiteSpace(x.Nombre)) errores.Add("Carta sin Nombre.");
                if (string.IsNullOrWhiteSpace(x.Numero)) errores.Add($"Carta '{x.Nombre}' sin número de colección.");
                if (x.Stock is < 0) errores.Add($"Stock negativo en carta '{x.Nombre}'.");
            }
            if (errores.Count > 0)
                throw new ValidationException(string.Join(" ", errores));

            // 4) Confirmar existencia del Set (una sola consulta)
            var set = await _setRepository.Obtener(s => s.IdSet == setId);
            if (set is null)
                throw new NotFoundException($"El Set {setId} no existe.");

            // 5) De-dup en memoria por Numero (case-insensitive) dentro del lote
            var unicos = normalizadas
                .GroupBy(x => x.NumeroKey)
                .Select(g => g.First())
                .ToList();

            // 6) Traer existentes SOLO de ese Set y construir HashSet de numeros
            var existentes = await _cartaRepository.Consultar(c => c.IdSet == setId);
            var numerosExistentes = existentes
                .Select(c => (c.Numero ?? string.Empty).Trim().ToUpperInvariant())
                .ToHashSet();

            // 7) Filtrar candidatas (no existentes por (IdSet, Numero)) y mapear entidades
            var candidatas = unicos
                .Where(x => !numerosExistentes.Contains(x.NumeroKey))
                .Select(x =>
                {
                    var dto = x.Dto;
                    dto.IdSet = setId;         // asegurar IdSet unificado
                    dto.Nombre = x.Nombre;     // normalizaciones aplicadas
                    dto.Rareza = x.Rareza;
                    dto.Tipo = x.Tipo;
                    dto.ImagenUrl = x.ImagenUrl;
                    dto.Numero = x.NumeroKey;  // guardar normalizado (mayúsculas)
                    return _mapper.Map<Carta>(dto);
                })
                .ToList();

            if (candidatas.Count == 0)
                return true; // nada que crear (idempotente)

            // 8) Crear una a una
            var creadas = 0;
            foreach (var entity in candidatas)
            {
                var creada = await _cartaRepository.Crear(entity);
                if (creada is not null && creada.IdCarta > 0)
                    creadas++;
            }

            return creadas == candidatas.Count;
        }

        public async Task<bool> Editar(CartaDTO dto)
        {
            if (dto is null) throw new ValidationException("Los datos de la carta son obligatorios.");
            if (dto.IdCarta <= 0) throw new ValidationException("El Id de la carta es inválido.");

            var existente = await _cartaRepository.Obtener(c => c.IdCarta == dto.IdCarta);
            if (existente is null) throw new NotFoundException("La carta no existe.");

            // Validaciones/normalizaciones si vienen en el DTO
            if (!string.IsNullOrWhiteSpace(dto.Nombre))
            {
                var nombre = dto.Nombre.Trim();
                // Unicidad por Set (excluyendo la propia carta)
                var conflicto = await _cartaRepository.Obtener(c =>
                    c.IdSet == (dto.IdSet != 0 ? dto.IdSet : existente.IdSet) &&
                    c.Nombre.ToUpper() == nombre.ToUpper() &&
                    c.IdCarta != dto.IdCarta);
                if (conflicto is not null)
                    throw new ConflictException($"Ya existe una carta llamada '{nombre}' en este set.");

                dto.Nombre = nombre;
            }

            if (dto.Stock is not null && dto.Stock < 0)
                throw new ValidationException("El stock no puede ser negativo.");

            if (!string.IsNullOrWhiteSpace(dto.Rareza)) dto.Rareza = dto.Rareza.Trim();
            if (!string.IsNullOrWhiteSpace(dto.Tipo)) dto.Tipo = dto.Tipo.Trim();
            if (!string.IsNullOrWhiteSpace(dto.ImagenUrl)) dto.ImagenUrl = dto.ImagenUrl.Trim();

            // Si permiten cambiar de Set, valida el nuevo IdSet
            if (dto.IdSet != 0 && dto.IdSet != existente.IdSet)
            {
                var set = await _setRepository.Obtener(s => s.IdSet == dto.IdSet);
                if (set is null) throw new NotFoundException("El set de destino no existe.");
            }

            // Mapear en la entidad cargada y guardar
            _mapper.Map(dto, existente);

            var ok = await _cartaRepository.Editar(existente);
            if (!ok) throw new Exception("Error al editar la carta.");

            // Devolver DTO actualizado (si necesitas navs, vuelve a consultar con ProjectTo)
            return ok;
        }

        public async Task<bool> Eliminar(int id)
        {
            var carta = await _cartaRepository.Obtener(c => c.IdCarta == id);
            if (carta is null) throw new NotFoundException("La carta no existe.");

            try
            {
                var ok = await _cartaRepository.Eliminar(carta);
                if (!ok) throw new Exception("Error al eliminar la carta.");
            }
            catch (DbUpdateException ex)
            {                
                throw new ConflictException("No se puede eliminar la carta por dependencias asociadas.", ex);
            }

            return true;
        }

        
    }
}
