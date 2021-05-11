using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.ComponentModel.DataAnnotations;

namespace Application.Features.TicketFeatures.Commands.CreateTicketCommand
{
    public class CreateTicketCommand : IRequest<Ticket>
    {
        [Required]
        [BsonRepresentation(BsonType.ObjectId)]
        public string UserId { get; set; }
        [Required]
        public string Title { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public string Category { get; set; }
        [Required]
        public string Priority { get; set; }
        public DateTime Date { get; set; } = DateTime.Now;
    }
}
