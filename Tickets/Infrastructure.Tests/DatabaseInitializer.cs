using Application.Interfaces;
using Domain.Entities;
using System;

namespace Infrastructure.Tests
{
    public static class DatabaseInitializer
    {
        public static void Initialize(IApplicationDbContext context)
        {
            Seed(context);
        }

        private static void Seed(IApplicationDbContext context)
        {
            var tickets = new[]
            {
                new Ticket
                {
                    Id = "6075e868974ac5357820d428",
                    UserId = "6074531345581bfd33ca2cd1",
                    ConsultantId = "6075562e88483d99268df881",
                    Title = "My phone stopped working",
                    Description = "My phone stopped working",
                    Category = "Hardware",
                    Status = "open",
                    Priority = "high",
                    Date = Convert.ToDateTime("2021-04-12T18:49:43.199+00:00")
                },
                new Ticket
                {
                    Id = "7075e868974ac5357820d428",
                    UserId = "6074531345581bfd33ca2cd1",
                    ConsultantId = "6075562e88483d99268df881",
                    Title = "My phone stopped working",
                    Description = "My phone stopped working",
                    Category = "Software",
                    Status = "open",
                    Priority = "medium",
                    Date = Convert.ToDateTime("2021-04-11T18:49:43.199+00:00")
                }
            };

            context.GetCollection<Ticket>().InsertMany(tickets);
        }
    }
}
