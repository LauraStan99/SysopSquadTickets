using Application.Features.TicketFeatures.Commands.CreateTicketCommand;
using System;

namespace Tests.Helpers.UserFactories
{
    public static class CreateTicketCommandFactory
    {
        public static CreateTicketCommand ValidCreateTicketCommand() => new()
        {
            UserId = "6074531345581bfd33ca2cd1",
            Title = "My phone stopped working",
            Description = "My phone stopped working",
            Category = "Hardware",
            Priority = "High",
            Date = DateTime.Now
        };

        
    }
}