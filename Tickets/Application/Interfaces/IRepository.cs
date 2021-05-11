using System.Collections.Generic;
using System.Threading.Tasks;
using Domain.Common;

namespace Application.Interfaces
{
    public interface IRepository<TEntity> where TEntity : BaseEntity
    {
        Task<TEntity> CreateAsync(TEntity entity);
        Task<bool> DeleteAsync(string id);
        Task<TEntity> UpdateAsync(TEntity entity);

        Task<IEnumerable<TEntity>> GetAllAsync();
        Task<TEntity> GetByIdAsync(string id);
        Task<IEnumerable<TEntity>> GetAllByUserIdAsync(string userId);
        Task<IEnumerable<TEntity>> GetAllByConsultantIdAsync(string consultantId);
        Task<IEnumerable<TEntity>> GetAllByStatusAsync(string status);
        Task<TEntity> GetByUserIdAndConsultantIdAsync(string userId, string consultantId);

        Task<TEntity> UpdateStatusAsync(TEntity entity);
    }
}
