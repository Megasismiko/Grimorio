using Grimorio.Model;

namespace Grimorio.DAL.Repositorios.Contrato
{
    public interface IVentaRepository : IGenericRepository<Venta>
    {
        Task<Venta> Registrar(Venta venta);
    }
}
