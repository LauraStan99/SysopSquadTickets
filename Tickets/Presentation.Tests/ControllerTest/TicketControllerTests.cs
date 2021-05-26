using Application.Features.TicketFeatures.Queries.GetAllTicketsQuery;
using FakeItEasy;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using WebApi.Controllers.v1;
using Xunit;
using FluentAssertions;
using MongoDB.Bson;
using Application.Features.TicketFeatures.Queries.GetTicketByIdQuery;
using Application.Features.TicketFeatures.Commands.DeleteTicketByIdCommand;
using Tests.Helpers.UserFactories;
using Tests.Helpers;

namespace Presentation.Tests.TicketControllerTest
{
    public class TicketControllerTests
    {
        private readonly TicketController _controller;
        private readonly IMediator _mediator;
        public TicketControllerTests()
        {
            _mediator = A.Fake<IMediator>();
            _controller = new TicketController(_mediator);
        }

        [Fact]
        public async Task GivenTicketController_WhenGetAllIsCalled_ThenReturnTicketsCollection()
        {
            var result = await _controller.GetAll();
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(A<GetAllTicketsQuery>._, default)).MustHaveHappenedOnceExactly();

        }

        [Fact]
        public async Task GivenTicketController_WhenGetByIdIsCalled_ThenReturnTicketWithId()
        {
            var id = ObjectId.GenerateNewId().ToString();

            var result = await _controller.GetById(id);
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(A<GetTicketByIdQuery>._, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenTicketController_WhenDeleteIsCalledWithNewId_ThenReturnNotFound()
        {
            var id = ObjectId.GenerateNewId().ToString();

            var result = await _controller.Delete(id);
            var notFoundResult = result as NotFoundResult;

            notFoundResult.Should().NotBeNull();
            notFoundResult.StatusCode.Should().Be(404);
            A.CallTo(() => _mediator.Send(A<DeleteTicketByIdCommand>._, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenTicketController_WhenCreateIsCalled_ThenReturnTicket()
        {
            var command = CreateTicketCommandFactory.ValidCreateTicketCommand();

            var result = await _controller.Create(command);
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(command, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenTicketController_WhenUpdateIsCalled_ThenReturnNoContent()
        {
            var userId = ObjectId.GenerateNewId().ToString();
            var consultantId = ObjectId.GenerateNewId().ToString();
            var command = UpdateTicketByIdFactory.ValidUpdateTicketCommand(userId,consultantId);

            var result = await _controller.Update(command);
            var noContentResult = result as NoContentResult;

            noContentResult.Should().NotBeNull();
            noContentResult.StatusCode.Should().Be(204);
            A.CallTo(() => _mediator.Send(command, default)).MustHaveHappenedOnceExactly();
        }
    }
}
