using MediatR;
using Application.Interfaces;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.TicketFeatures.Commands.DeleteTicketByIdCommand
{
    public class DeleteTicketByIdCommandHandler : IRequestHandler<DeleteTicketByIdCommand, bool>
    {
        private readonly ITicketRepository _repository;

        public DeleteTicketByIdCommandHandler(ITicketRepository repository)
        {
            _repository = repository;
        }

        public async Task<bool> Handle(DeleteTicketByIdCommand request, CancellationToken cancellationToken)
        {
            return await _repository.DeleteAsync(request.Id);
        }
    }
}
