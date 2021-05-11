using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.Collections.Generic;

namespace Application.Features.TicketFeatures.Queries.GetAllTicketsByConsultantIdQuery
{
    public class GetAllTicketsByConsultantIdQuery : IRequest<IEnumerable<Ticket>>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string ConsultantId;

        public GetAllTicketsByConsultantIdQuery(string consultantId)
        {
            ConsultantId = consultantId;
        }
    }
}
