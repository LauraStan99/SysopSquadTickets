using Application.Helpers;
using Application.Interfaces;
using AutoMapper;
using Domain.Entities;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.TicketFeatures.Commands.UpdateStatusTicketByIdCommand
{
    public class UpdateStatusTicketByIdCommandHandler : IRequestHandler<UpdateStatusTicketByIdCommand, Ticket>
    {
        private readonly ITicketRepository _repository;
        private readonly IMapper _mapper;

        public UpdateStatusTicketByIdCommandHandler(ITicketRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<Ticket> Handle(UpdateStatusTicketByIdCommand request, CancellationToken cancellationToken)
        {
            var ticket = _mapper.Map<Ticket>(request);

            var updatedTicket = await _repository.UpdateStatusAsync(ticket);
            if (updatedTicket == null)
                return null;

            HttpRequestAccountsApi _request = new HttpRequestAccountsApi();
            var user = _request.GetUserById(updatedTicket.UserId);

            SendEmail _sendEmail = new SendEmail();

            if (request.Status == "Solved")
            {
                _sendEmail.SendEmailStatusAndMessage(request.Status, user, request.Message);
            }
            else
            {
                _sendEmail.SendEmailStatus(request.Status, user);
            }

            if (request.Status != "Open")
            {
                var consultant = _request.GetConsultantById(updatedTicket.ConsultantId);
                _request.IncreaseNoOfTicketsConsultant(consultant.Id, consultant.NumberOfTickets);
            }
            
            return updatedTicket;
        }
    }
}
