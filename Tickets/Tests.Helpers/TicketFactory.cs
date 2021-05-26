using Application.Interfaces;
using Domain.Entities;
using System;

namespace Tests.Helpers
{
    public static class TicketsFactory
    {
        public static Ticket ValidTicket()
        {
            return new Ticket
            {
                UserId = "6074531345581bfd33ca2cd1",
                ConsultantId = "6075562e88483d99268df881",
                Title = "My phone stopped working",
                Description = "My phone stopped working",
                Category = "Hardware",
                Status = "Open",
                Priority = "High",
                Date = DateTime.Now
            };
        }
        public static Ticket ValidNewTicket()
        {
            return new Ticket
            {   Id= "6074531345581bfd33ca0000",
                UserId = "6074531345581bfd33ca2cd1",
                ConsultantId = "6075562e88483d99268df881",
                Title = "My phone stopped working",
                Description = "My phone stopped working",
                Category = "Hardware",
                Status = "Open",
                Priority = "High",
                Date = DateTime.Now
            };
        }
        public static Ticket AddedTicket(IApplicationDbContext context)
        {
            var ticket = ValidTicket();
            context.GetCollection<Ticket>().InsertOne(ticket);
            return ticket;
        }

        public static Ticket Added2Tickets(IApplicationDbContext context)
        {
            var ticket1 = ValidTicket();
            var ticket2 = ValidTicket();
            context.GetCollection<Ticket>().InsertOne(ticket1);
            context.GetCollection<Ticket>().InsertOne(ticket2);
            return ticket1;
        }

        public static Ticket UpdateStatusValidTicket(string id)
        {
            return new Ticket
            {
                Id = id,
                Status = "Closed"           
            };
        }

        public static Ticket UpdateValidTicket(string userId,string consultantId)
        {
            return new Ticket
            {
               
                UserId = userId,
                ConsultantId = consultantId,
                Status = "Closed",
                Priority = "Low"
            };
        }
    }
}
