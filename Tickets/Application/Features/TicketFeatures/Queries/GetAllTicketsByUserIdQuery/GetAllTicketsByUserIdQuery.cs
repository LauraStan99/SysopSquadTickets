using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.Collections.Generic;

namespace Application.Features.TicketFeatures.Queries.GetAllTicketsByUserIdQuery
{
    public class GetAllTicketsByUserIdQuery : IRequest<IEnumerable<Ticket>>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string UserId;

        public GetAllTicketsByUserIdQuery(string userId)
        {
            UserId = userId;
        }
    }
}
