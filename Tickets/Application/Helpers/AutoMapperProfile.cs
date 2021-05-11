using Application.Features.TicketFeatures.Commands.UpdateTicketByIdCommand;
using Application.Features.TicketFeatures.Commands.CreateTicketCommand;
using AutoMapper;
using Domain.Entities;
using Application.Features.TicketFeatures.Commands.UpdateStatusTicketByIdCommand;

namespace Application.Helpers
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<UpdateTicketByIdCommand, Ticket>();
            CreateMap<CreateTicketCommand, Ticket>();
            CreateMap<UpdateStatusTicketByIdCommand, Ticket>();
        }
    }
}
