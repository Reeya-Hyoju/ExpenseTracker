using ExpenseTracker.Application.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace ExpenseTracker.Infrastructure.Data
{
    public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : class
    {
        private readonly ApplicationDbContext _context;
        private DbSet<TEntity> _entities;
        public GenericRepository(ApplicationDbContext context)
        {
            _context = context;
            _entities = context.Set<TEntity>();
        }
        public IQueryable<TEntity> Table => _entities.AsQueryable();
        public IQueryable<TEntity> TableNoTracking => _entities.AsNoTracking().AsQueryable();
        public async Task<TEntity> AddAsync(TEntity entity)
        {
            await _entities.AddAsync(entity);
            return entity;
        }
        public void Delete(TEntity entity)
        {
            _context.Remove(entity);
        }
        public async Task<TEntity> GetByIdAsync(Guid id)
        {
            return await _entities.FindAsync(id);
        }
        public async Task<IEnumerable<TEntity>> GetAllAsync()
        {
            return await _entities.ToListAsync();
        }
        public async Task<int> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync();
        }
        public void Update(TEntity entity)
        {
            _entities.Update(entity);
        }
        public async Task<TEntity> FirstOrDefaultAsync()
        {
            return await _entities.FirstOrDefaultAsync();
        }
    }
}
