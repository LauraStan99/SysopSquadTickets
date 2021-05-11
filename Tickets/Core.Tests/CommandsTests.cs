using System.Threading;
using System.Threading.Tasks;
using Application.Features.TicketFeatures.Commands.DeleteTicketByIdCommand;
using Application.Interfaces;
using FluentAssertions;
using Moq;
using Tests.Helpers;
using Xunit;

namespace Core.Tests
{
    public class CommandsTests
    {
        [Fact]
        public async Task GivenAnId_WhenDeleteTicketByIdCommandHandler_ThenReturnTrue()
        {
            var ticket = TicketsFactory.ValidTicket();
            var command = new DeleteTicketByIdCommand(ticket.Id);
            var mockRepo = new Mock<ITicketRepository>();
            mockRepo.Setup(db => db.DeleteAsync(command.Id).Result).Returns(true);
            var handler = new DeleteTicketByIdCommandHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().BeTrue();
        }
    }
}
