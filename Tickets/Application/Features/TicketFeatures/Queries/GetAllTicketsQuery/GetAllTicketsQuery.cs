using Domain.Entities;
using MediatR;
using System.Collections.Generic;

namespace Application.Features.TicketFeatures.Queries.GetAllTicketsQuery
{
    public class GetAllTicketsQuery : IRequest<IEnumerable<Ticket>> { }
}
