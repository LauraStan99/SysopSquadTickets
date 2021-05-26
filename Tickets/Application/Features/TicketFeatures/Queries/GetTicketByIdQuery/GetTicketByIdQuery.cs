using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.TicketFeatures.Queries.GetTicketByIdQuery
{
    public class GetTicketByIdQuery : IRequest<Ticket>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string Id;

        public GetTicketByIdQuery(string id)
        {
            Id = id;
        }
    }
}
