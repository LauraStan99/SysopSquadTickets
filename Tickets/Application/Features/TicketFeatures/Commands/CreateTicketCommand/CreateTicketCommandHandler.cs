using Application.Helpers;
using Application.Interfaces;
using AutoMapper;
using Domain.Entities;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.TicketFeatures.Commands.CreateTicketCommand
{
    public class CreateTicketCommandHandler : IRequestHandler<CreateTicketCommand,Ticket>
    {
        private readonly ITicketRepository _repository;
        private readonly IMapper _mapper;

        public CreateTicketCommandHandler(ITicketRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<Ticket> Handle(CreateTicketCommand request, CancellationToken cancellationToken)
        {
            var ticket = _mapper.Map<Ticket>(request);

            HttpRequestAccountsApi _request = new HttpRequestAccountsApi();

            var location = _request.GetUserById(ticket.UserId).Location;
            var consultant = _request.GetBestConsultant(ticket.Category, location);

            ticket.ConsultantId = consultant.Id;
            ticket.Status = "Pending";

            _request.UpdateNoOfTicketsConsultant(consultant.Id, consultant.NumberOfTickets);

            return await _repository.CreateAsync(ticket);
        }
    }
}
