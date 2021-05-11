using Application.Features.TicketFeatures.Queries.GetAllTicketsQuery;
using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using Moq;
using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace Infrastructure.Tests
{
    public class GetAllTicketsHandlerTest
    {
        private readonly CancellationToken cancellationToken = new CancellationToken();

        [Fact]
        public async Task GivenAList_WhenGetAllTicketsQueryHandler_ThenReturnNotNull()
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

            var command = new GetAllTicketsQuery();

            var mockRepo = new Mock<ITicketRepository>();
            mockRepo.Setup(db => db.GetAllAsync().Result).Returns(tickets.ToList<Ticket>);

            var sut = new GetAllTicketsQueryHandler(mockRepo.Object);
            await sut.Handle(command,cancellationToken);

            sut.Should().NotBeNull();
        }
    }
}
