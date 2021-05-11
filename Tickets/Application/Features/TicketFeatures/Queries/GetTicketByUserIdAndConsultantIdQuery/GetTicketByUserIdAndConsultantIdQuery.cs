using Domain.Entities;
using MediatR;

namespace Application.Features.TicketFeatures.Queries.GetTicketByUserIdAndConsultantIdQuery
{
    public class GetTicketByUserIdAndConsultantIdQuery : IRequest<Ticket>
    {
        public readonly string UserId;
        public readonly string ConsultantId;

        public GetTicketByUserIdAndConsultantIdQuery(string userId, string consultantId)
        {
            UserId = userId;
            ConsultantId = consultantId;
        }
    }
}
