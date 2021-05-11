using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.TicketFeatures.Commands.DeleteTicketByIdCommand
{
    public class DeleteTicketByIdCommand : IRequest<bool>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string Id;
        public DeleteTicketByIdCommand(string id)
        {
            Id = id;
        }
    }
}
