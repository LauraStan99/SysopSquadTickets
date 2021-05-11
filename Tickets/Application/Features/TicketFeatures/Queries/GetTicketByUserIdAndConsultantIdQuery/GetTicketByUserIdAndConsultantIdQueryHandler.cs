using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.TicketFeatures.Queries.GetTicketByUserIdAndConsultantIdQuery
{
    public class GetTicketByUserIdAndConsultantIdQueryHandler : IRequestHandler<GetTicketByUserIdAndConsultantIdQuery, Ticket>
    {
        private readonly ITicketRepository _repository;

        public GetTicketByUserIdAndConsultantIdQueryHandler(ITicketRepository repository)
        {
            _repository = repository;
        }
        
        public async Task<Ticket> Handle(GetTicketByUserIdAndConsultantIdQuery request, CancellationToken cancellationToken)
        {
            var ticket =  await _repository.GetByUserIdAndConsultantIdAsync(request.UserId, request.ConsultantId);
            if(ticket == null)
            {
                throw new ArgumentException("Ticket not found!", nameof(request));
            }
            return ticket;
        }
    }
}
