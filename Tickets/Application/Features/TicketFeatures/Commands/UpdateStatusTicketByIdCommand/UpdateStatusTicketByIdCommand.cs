using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.ComponentModel.DataAnnotations;

namespace Application.Features.TicketFeatures.Commands.UpdateStatusTicketByIdCommand
{
    public class UpdateStatusTicketByIdCommand : IRequest<Ticket>
    {
        [Required]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }
        public string Status { get; set; }
        public string Message { get; set; }
        public string UserToken { get; set; }
    }
}
