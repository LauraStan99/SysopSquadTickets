using Application.Interfaces;
using Domain.Entities;

namespace Persistence.Repository.v1
{
    public class TicketRepository : Repository<Ticket>, ITicketRepository
    {
        public TicketRepository(IApplicationDbContext context) : base(context) {
        }
    }
}
