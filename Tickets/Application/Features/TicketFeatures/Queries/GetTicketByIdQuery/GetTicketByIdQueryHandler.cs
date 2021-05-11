using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.TicketFeatures.Queries.GetTicketByIdQuery
{
    public class GetTicketByIdQueryHandler : IRequestHandler<GetTicketByIdQuery, Ticket>
    {
        private readonly ITicketRepository _repository;

        public GetTicketByIdQueryHandler(ITicketRepository repository)
        {
            _repository = repository;
        }
        
        public async Task<Ticket> Handle(GetTicketByIdQuery request, CancellationToken cancellationToken)
        {
            var ticket = await _repository.GetByIdAsync(request.Id);
            if (ticket == null)
                throw new ArgumentException("Ticket not found!", nameof(request));
            return ticket;
        }
    }
}
