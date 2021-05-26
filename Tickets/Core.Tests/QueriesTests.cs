using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Application.Features.TicketFeatures.Queries.GetAllTicketsQuery;
using Application.Features.TicketFeatures.Queries.GetTicketByIdQuery;
using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using Moq;
using Tests.Helpers;
using Xunit;

namespace Core.Tests
{
    public class QueriesTests
    {
        [Fact]
        public async Task GivenAList_WhenGetAllTicketsQueryHandler_ThenReturnNotNull()
        {
            var ticket1 = TicketsFactory.ValidTicket();
            var ticket2 = TicketsFactory.ValidTicket();
            var tickets = new List<Ticket> { ticket1, ticket2 };
            var command = new GetAllTicketsQuery();
            var mockRepo = new Mock<ITicketRepository>();
            mockRepo.Setup(db => db.GetAllAsync().Result).Returns(tickets);
            var handler = new GetAllTicketsQueryHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().NotContainNulls();
            result.Should().HaveCount(tickets.Count);
            result.Should().Contain(ticket1);
        }
    }
}
