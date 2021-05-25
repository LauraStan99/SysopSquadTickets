using System.Net;
using System.Net.Cache;
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

            HttpRequestAccountsApi _request = new HttpRequestAccountsApi(request.UserToken);
            var user = _request.GetUserById(updatedTicket.UserId);

            SendEmail _sendEmail = new SendEmail();
            var consultant = _request.GetConsultantById(updatedTicket.ConsultantId);
            if (request.Message != null)
            {
                _sendEmail.SendEmailStatusAndMessage(updatedTicket.Status, user, request.Message);
                _request.UpdateSolvedNoOfTicketsConsultant(consultant.Id, consultant.SolvedNumberOfTickets);
            }
            else
            {
                _sendEmail.SendEmailStatus(request.Status, user);
            }

            if(updatedTicket.Status != "Open")
            {
                _request.IncreaseNoOfTicketsConsultant(consultant.Id, consultant.NumberOfTickets);
            }
            
            return updatedTicket;
        }
    }
}
