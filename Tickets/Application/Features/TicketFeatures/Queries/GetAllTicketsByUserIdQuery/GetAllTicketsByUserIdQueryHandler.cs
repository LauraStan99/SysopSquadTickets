using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.TicketFeatures.Queries.GetAllTicketsByUserIdQuery
{
    public class GetAllTicketsByUserIdQueryHandler : IRequestHandler<GetAllTicketsByUserIdQuery, IEnumerable<Ticket>>
    {
        private readonly ITicketRepository _repository;

        public GetAllTicketsByUserIdQueryHandler(ITicketRepository repository)
        {
            _repository = repository;
        }
        
        public async Task<IEnumerable<Ticket>> Handle(GetAllTicketsByUserIdQuery request, CancellationToken cancellationToken)
        {
            IEnumerable<Ticket> listTickets = await _repository.GetAllByUserIdAsync(request.UserId);
            if(!listTickets.Any())
            {
                throw new ArgumentException("User does not have any sent tickets.", nameof(request));
            }
            return listTickets;
        }
    }
}
