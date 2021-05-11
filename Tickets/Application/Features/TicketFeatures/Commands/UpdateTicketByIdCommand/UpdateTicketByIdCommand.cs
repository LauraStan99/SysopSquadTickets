using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.ComponentModel.DataAnnotations;

namespace Application.Features.TicketFeatures.Commands.UpdateTicketByIdCommand
{
    public class UpdateTicketByIdCommand : IRequest<Ticket>
    {
        [Required]
        [BsonRepresentation(BsonType.ObjectId)]
        public string UserId { get; set; }

        [Required]
        [BsonRepresentation(BsonType.ObjectId)]
        public string ConsultantId { get; set; }

        public string Status { get; set; }
        public string Priority { get; set; }
    }
}
