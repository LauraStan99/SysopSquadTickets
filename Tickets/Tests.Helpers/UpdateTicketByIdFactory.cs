using Application.Features.TicketFeatures.Commands.UpdateTicketByIdCommand;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tests.Helpers
{
    public static class UpdateTicketByIdFactory
    {
        public static UpdateTicketByIdCommand ValidUpdateTicketCommand(string userId, string consultantId)
        {
            return new()
            {

                UserId = userId,
                ConsultantId = consultantId,
                Status = "Open",
                Priority = "High",
 
            };
        }
    }
}
