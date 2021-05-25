using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.TicketFeatures.Queries.GetAllTicketsByConsultantIdQuery
{
    public class GetAllTicketsByConsultantIdQueryHandler : IRequestHandler<GetAllTicketsByConsultantIdQuery, IEnumerable<Ticket>>
    {
        private readonly ITicketRepository _repository;

        public GetAllTicketsByConsultantIdQueryHandler(ITicketRepository repository)
        {
            _repository = repository;
        }
        
        public async Task<IEnumerable<Ticket>> Handle(GetAllTicketsByConsultantIdQuery request, CancellationToken cancellationToken)
        {
            var listTickets = await _repository.GetAllByConsultantIdAsync(request.ConsultantId);

            if ( !listTickets.Any() )
                throw new ArgumentException("Consultant does not have any received tickets.", nameof(request));

            return listTickets;
        }
    }
}
