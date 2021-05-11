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

        [Fact]
        public async Task GivenAnId_WhenGetTicketByIdQueryHandler_ThenReturnNotNull()
        {
            var ticket = TicketsFactory.ValidTicket();
            var command = new GetTicketByIdQuery(ticket.Id);
            var mockRepo = new Mock<ITicketRepository>();
            mockRepo.Setup(db => db.GetByIdAsync(command.Id).Result).Returns(ticket);
            var handler = new GetTicketByIdQueryHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().NotBeNull();
            result.Id.Should().Be(ticket.Id);
            result.UserId.Should().Be(ticket.UserId);
            result.ConsultantId.Should().Be(ticket.ConsultantId);
            result.Title.Should().Be(ticket.Title);
            result.Description.Should().Be(ticket.Description);
            result.Category.Should().Be(ticket.Category);
            result.Status.Should().Be(ticket.Status);
            result.Priority.Should().Be(ticket.Priority);
            result.Date.Should().Be(ticket.Date);
        }
    }
}
