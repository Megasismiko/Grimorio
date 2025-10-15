using Grimorio.DAL.DBContext;
using Grimorio.DAL.Repositorios.Contrato;
using Grimorio.Model;

namespace Grimorio.DAL.Repositorios
{
    public class VentaRepository : GenericRepository<Venta>, IVentaRepository
    {
        private readonly GrimorioDbContext _dbContext;

        public VentaRepository(GrimorioDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Venta> Registrar(Venta venta)
        {

            Venta ventaGenerada;

            using (var transaccion = _dbContext.Database.BeginTransaction())
            {
                try
                {
                    foreach (DetalleVenta dv in venta.DetalleVenta)
                    {
                        Carta cartaEncontrada = _dbContext.Cartas.First(carta => carta.IdCarta == dv.IdCarta);
                        cartaEncontrada.Stock = cartaEncontrada.Stock - dv.Cantidad;
                        _dbContext.Cartas.Update(cartaEncontrada);
                    }

                    await _dbContext.SaveChangesAsync();

                    venta.NumeroDocumento = await GenerarNumeroVenta();

                    await _dbContext.Venta.AddAsync(venta);
                    await _dbContext.SaveChangesAsync();

                    ventaGenerada = venta;

                    transaccion.Commit();
                }
                catch
                {
                    transaccion.Rollback();
                    throw;
                }
            }

            return ventaGenerada;

        }

        private async Task<string> GenerarNumeroVenta()
        {
            NumeroDocumento correlativo = _dbContext.NumeroDocumentos.First();
            correlativo.UltimoNumero = correlativo.UltimoNumero + 1;
            correlativo.FechaRegistro = DateTime.Now;
            _dbContext.NumeroDocumentos.Update(correlativo);
            await _dbContext.SaveChangesAsync();
            int digitos = 4;
            string ceros = string.Concat(Enumerable.Repeat("0", digitos));
            string numeroVenta = ceros + correlativo.UltimoNumero.ToString();
            numeroVenta = numeroVenta.Substring(numeroVenta.Length - digitos, digitos);
            return numeroVenta;
        }
    
    }
}
