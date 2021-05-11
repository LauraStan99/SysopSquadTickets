using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.TicketFeatures.Queries.GetAllTicketsByStatusQuery
{
    public class GetAllTicketsByStatusQueryHandler : IRequestHandler<GetAllTicketsByStatusQuery, IEnumerable<Ticket>>
    {
        private readonly ITicketRepository _repository;

        public GetAllTicketsByStatusQueryHandler(ITicketRepository repository)
        {
            _repository = repository;
        }
        
        public async Task<IEnumerable<Ticket>> Handle(GetAllTicketsByStatusQuery request, CancellationToken cancellationToken)
        {
            var listTickets = await _repository.GetAllByStatusAsync(request.Status);

            if(!listTickets.Any())
            {
                throw new ArgumentException("There are no tickets with this status.", nameof(request));
            }
            return listTickets;
        }
    }
}
