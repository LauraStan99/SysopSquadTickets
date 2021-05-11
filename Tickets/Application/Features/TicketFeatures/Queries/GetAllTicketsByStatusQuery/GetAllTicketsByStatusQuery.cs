using Domain.Entities;
using MediatR;
using System.Collections.Generic;

namespace Application.Features.TicketFeatures.Queries.GetAllTicketsByStatusQuery
{
    public class GetAllTicketsByStatusQuery : IRequest<IEnumerable<Ticket>>
    {
        public readonly string Status;

        public GetAllTicketsByStatusQuery(string status)
        {
            Status = status;
        }
    }
}
