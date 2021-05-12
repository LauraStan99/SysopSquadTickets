using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Application.Interfaces;
using Domain.Common;
using MongoDB.Driver;


namespace Persistence.Repository.v1
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : BaseEntity
    {
        private readonly IApplicationDbContext _context;

        public Repository(IApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<TEntity>> GetAllAsync()
        {
            try
            {
                return await _context.GetCollection<TEntity>().FindAsync(entity => true).Result.ToListAsync();
            }
            catch (Exception ex)
            {
                throw new ArgumentException($"Couldn't get entities: {ex.Message}");
            }
        }

        public async Task<TEntity> GetByIdAsync(string id)
        {
            return await _context.GetCollection<TEntity>().Find<TEntity>(entity => entity.Id == id).FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<TEntity>> GetAllByUserIdAsync(string userId)
        {
            return await _context.GetCollection<TEntity>().FindAsync(entity => entity.UserId == userId).Result.ToListAsync();
        }

        public async Task<IEnumerable<TEntity>> GetAllByConsultantIdAsync(string consultantId)
        {
            try
            {
                return await _context.GetCollection<TEntity>().FindAsync(entity => entity.ConsultantId == consultantId).Result.ToListAsync();
            }
            catch (Exception ex)
            {
                throw new ArgumentException($"Couldn't get entities: {ex.Message}");
            }
        }

        public async Task<IEnumerable<TEntity>> GetAllByStatusAsync(string status)
        {
            return await _context.GetCollection<TEntity>().FindAsync(entity => entity.Status == status).Result.ToListAsync();
        }
        
        public async Task<TEntity> CreateAsync(TEntity entity)
        {
            await _context.GetCollection<TEntity>().InsertOneAsync(entity);
            return entity;
        }

        public async Task<TEntity> UpdateAsync(TEntity entity)
        {
            var foundEntity = await GetByUserIdAndConsultantIdAsync(entity.UserId, entity.ConsultantId);

            if (foundEntity == null)
                return null;
            
            foundEntity.Status = entity.Status;
            foundEntity.UserId = entity.UserId;
            foundEntity.ConsultantId = entity.ConsultantId;
            foundEntity.Priority = entity.Priority;
            await _context.GetCollection<TEntity>().ReplaceOneAsync(filter: ticket => ticket.Id == foundEntity.Id, replacement: foundEntity);
            return foundEntity;
        }

        public async Task<TEntity> UpdateStatusAsync(TEntity entity)
        {
            var foundEntity = await GetByIdAsync(entity.Id);
            if (foundEntity == null)
                return null;

            foundEntity.Status = entity.Status;
            if(entity.Message != null)
            {
                foundEntity.Message = entity.Message;
            }

            await _context.GetCollection<TEntity>().ReplaceOneAsync(filter: t => t.Id == entity.Id, replacement: foundEntity);
            return foundEntity;
        }

        public async Task<bool> DeleteAsync(string id)
        {
            var deleteResult = await _context.GetCollection<TEntity>().DeleteOneAsync(ticket => ticket.Id == id);

            return deleteResult.IsAcknowledged && deleteResult.DeletedCount > 0;
        }

        public async Task<TEntity> GetByUserIdAndConsultantIdAsync(string userId, string consultantId)
        {
            if (string.IsNullOrEmpty(userId) || string.IsNullOrEmpty(consultantId))
                return null;

            var ticket = await _context.GetCollection<TEntity>().Find<TEntity>(item => item.UserId == userId && item.ConsultantId == consultantId).FirstOrDefaultAsync();

            if (ticket == null)
                return null;

            return ticket;
        }
    }
}
