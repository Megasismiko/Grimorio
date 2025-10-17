using Grimorio.DAL.DBContext;
using Grimorio.DAL.Repositorios.Contrato;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace Grimorio.DAL.Repositorios
{
    public class GenericRepository<TModel> : IGenericRepository<TModel> where TModel : class
    {
        private readonly GrimorioDbContext _dbContext;

        public GenericRepository(GrimorioDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<TModel?> Obtener(Expression<Func<TModel, bool>> filtro)
        {
            try
            {
                TModel? modelo = await _dbContext.Set<TModel>().FirstOrDefaultAsync(filtro);
                return modelo;
            }
            catch
            {
                throw;
            }
        }

        public async Task<TModel> Crear(TModel model)
        {
            try
            {
                _dbContext.Set<TModel>().Add(model);
                await _dbContext.SaveChangesAsync();
                return model;
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> Editar(TModel model)
        {
            try
            {
                _dbContext.Set<TModel>().Update(model);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch
            {
                throw;
            }
        }

        public async Task<bool> Eliminar(TModel model)
        {
            try
            {
                _dbContext.Set<TModel>().Remove(model);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch
            {
                throw;
            }
        }

        public async Task<IQueryable<TModel>> Consultar(Expression<Func<TModel, bool>>? filtro)
        {
            try
            {
                IQueryable<TModel> consulta = filtro == null
                    ?  _dbContext.Set<TModel>()
                    :  _dbContext.Set<TModel>().Where(filtro);
                return consulta;
            }
            catch
            {
                throw;
            }
        }
    }
}
