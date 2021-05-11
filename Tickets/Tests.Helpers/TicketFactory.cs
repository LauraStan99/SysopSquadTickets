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
                Id = "6075e868974ac5357820d428",
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
            var evaluation = ValidTicket();
            context.GetCollection<Ticket>().InsertOne(evaluation);
            return evaluation;
        }

        public static Ticket Added2Tickets(IApplicationDbContext context)
        {
            var evaluation1 = ValidTicket();
            var evaluation2 = ValidTicket();
            context.GetCollection<Ticket>().InsertOne(evaluation1);
            context.GetCollection<Ticket>().InsertOne(evaluation2);
            return evaluation1;
        }

        public static Ticket UpdateScorValidTicket(string id)
        {
            return new Ticket
            {
                Id = id,
                Status = "Closed"           
            };
        }
    }
}
