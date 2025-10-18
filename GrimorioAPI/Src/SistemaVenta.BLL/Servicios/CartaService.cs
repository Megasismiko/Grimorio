using AutoMapper;
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

        public async Task<List<CartaDTO>> Lista()
        {
            try
            {
                var query = await _cartaRepository.Consultar();
                var cartas = query.Include(set => set.IdSetNavigation).ToList();
                return _mapper.Map<List<CartaDTO>>(cartas);
            }
            catch
            {
                throw;
            }
        }

        public async Task<List<CartaDTO>> ListaSet(int id)
        {
            try
            {
                var query = await _cartaRepository.Consultar(c => c.IdSet == id);
                var cartas = query.Include(set => set.IdSetNavigation).ToList();
                return _mapper.Map<List<CartaDTO>>(cartas);
            }
            catch
            {
                throw;
            }
        }

        public async Task<CartaDTO> Crear(CartaDTO dto)
        {
            try
            {
                var carta = await _cartaRepository.Crear(_mapper.Map<Carta>(dto));

                if (carta.IdCarta == 0)
                    throw new TaskCanceledException("No es posible crear la carta");

                var query = await _cartaRepository.Consultar(u => u.IdCarta == carta.IdCarta);

                carta = query.Include(set => set.IdSetNavigation).First();

                return _mapper.Map<CartaDTO>(carta);
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> Editar(CartaDTO dto)
        {
            try
            {
                var carta = _mapper.Map<Carta>(dto);
                var cartaExistente = await _cartaRepository.Obtener(u => u.IdCarta == carta.IdCarta);

                if (cartaExistente == null)
                    throw new TaskCanceledException("La carta no existe");

                cartaExistente.Nombre = carta.Nombre;
                cartaExistente.Stock = carta.Stock;
                cartaExistente.Precio = carta.Precio;
                cartaExistente.IdSet = carta.IdSet;
                cartaExistente.EsActivo = carta.EsActivo;
                cartaExistente.Coste = carta.Coste;
                cartaExistente.Tipo = carta.Tipo;
                cartaExistente.Rareza = carta.Rareza;
                cartaExistente.Texto = carta.Texto;
                cartaExistente.Artista = carta.Artista;
                cartaExistente.Numero = carta.Numero;
                cartaExistente.Poder = carta.Poder;
                cartaExistente.Resistencia = carta.Resistencia;
                cartaExistente.ImagenUrl = carta.ImagenUrl;


                bool result = await _cartaRepository.Editar(cartaExistente);
                if (!result)
                    throw new TaskCanceledException("Error al editar la carta");

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
                var carta = await _cartaRepository.Obtener(u => u.IdCarta == id);

                if (carta == null)
                    throw new TaskCanceledException("La carta no existe");

                bool result = await _cartaRepository.Eliminar(carta);

                if (!result)
                    throw new TaskCanceledException("Error al eliminar la carta");

                return result;
            }
            catch
            {
                throw;
            }
        }


    }
}
