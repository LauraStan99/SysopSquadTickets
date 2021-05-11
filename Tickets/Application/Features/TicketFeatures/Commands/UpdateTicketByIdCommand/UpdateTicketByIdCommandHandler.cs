using Application.Interfaces;
using AutoMapper;
using Domain.Entities;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.TicketFeatures.Commands.UpdateTicketByIdCommand
{
    public class UpdateTicketByIdCommandHandler : IRequestHandler<UpdateTicketByIdCommand, Ticket>
    {
        private readonly ITicketRepository _repository;
        private readonly IMapper _mapper;
        
        public UpdateTicketByIdCommandHandler(ITicketRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<Ticket> Handle(UpdateTicketByIdCommand request, CancellationToken cancellationToken)
        {
            var ticket = _mapper.Map<Ticket>(request);
           
            var updatedTicket = await _repository.UpdateAsync(ticket);
            return updatedTicket;
        }
    }
}
