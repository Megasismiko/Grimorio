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
            // Validaciones básicas
            if (dto is null) throw new ValidationException("Los datos de la carta son obligatorios.");
            if (dto.IdSet <= 0) throw new ValidationException("El Id del set es obligatorio.");
            if (string.IsNullOrWhiteSpace(dto.Nombre)) throw new ValidationException("El nombre es obligatorio.");
            if (dto.Stock is < 0) throw new ValidationException("El stock no puede ser negativo.");
           
         
            //  Validar FK Set existente (mejor mensaje que el error de BD)
            var set = await _setRepository.Obtener(s => s.IdSet == dto.IdSet);
            if (set is null) throw new NotFoundException("El set asociado no existe.");

            // Normalizaciones simples
            dto.Nombre = dto.Nombre.Trim();
            dto.Rareza = dto.Rareza?.Trim();
            dto.Tipo = dto.Tipo?.Trim();
            dto.ImagenUrl = dto.ImagenUrl?.Trim();

            // Regla de unicidad (ejemplo): Nombre único por Set
            var duplicado = await _cartaRepository.Obtener(c =>
                c.IdSet == dto.IdSet &&
                c.Nombre.ToUpper() == dto.Nombre.ToUpper());
            if (duplicado is not null)
                throw new ConflictException($"Ya existe una carta llamada '{dto.Nombre}' en este set.");

            // Crear
            var carta = _mapper.Map<Carta>(dto);
            var cartaCreada = await _cartaRepository.Crear(carta);

            if (cartaCreada is null || cartaCreada.IdCarta == 0)
                throw new Exception("No fue posible crear la carta.");

            return _mapper.Map<CartaDTO>(cartaCreada);
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
