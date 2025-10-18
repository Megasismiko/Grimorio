using AutoMapper;
using AutoMapper.QueryableExtensions;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.DTO;
using Grimorio.Model;
using Microsoft.EntityFrameworkCore;

namespace Grimorio.BLL.Servicios
{
    public class CartaService : ICartaService
    {
        private readonly IGenericRepository<Carta> _cartaRepository;
        private readonly IMapper _mapper;

        public CartaService(IGenericRepository<Carta> cartaRepository, IMapper mapper)
        {
            _cartaRepository = cartaRepository;
            _mapper = mapper;
        }

        public async Task<CartaDTO?> GetCartaById(int id)
        {
            var query = await _cartaRepository.Consultar(c => c.IdCarta == id);

            return await query
                .ProjectTo<CartaDTO>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync();
        }

        public async Task<CartaDTO> Crear(CartaDTO dto)
        {
            var nueva = await _cartaRepository.Crear(_mapper.Map<Carta>(dto));

            if (nueva is null || nueva.IdCarta == 0)
                throw new TaskCanceledException("No es posible crear la carta.");
                        
            var query = await _cartaRepository.Consultar(c => c.IdCarta == nueva.IdCarta);
            var dtoCreado = await query
                .ProjectTo<CartaDTO>(_mapper.ConfigurationProvider)
                .AsNoTracking()
                .FirstAsync();

            return dtoCreado;
        }

        public async Task<bool> Editar(CartaDTO dto)
        {
            var existente = await _cartaRepository.Obtener(c => c.IdCarta == dto.IdCarta);
            if (existente is null)
                throw new TaskCanceledException("La carta no existe.");

            _mapper.Map(dto, existente);

            var ok = await _cartaRepository.Editar(existente);
            if (!ok)
                throw new TaskCanceledException("Error al editar la carta.");

            return true;
        }

        public async Task<bool> Eliminar(int id)
        {
            var carta = await _cartaRepository.Obtener(c => c.IdCarta == id);
            if (carta is null)
                throw new TaskCanceledException("La carta no existe.");

            var ok = await _cartaRepository.Eliminar(carta);
            if (!ok)
                throw new TaskCanceledException("Error al eliminar la carta.");

            return true;
        }
    }
}
