using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using Persistence.Repository.v1;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;

namespace Infrastructure.Tests
{
    public class RepositoryTest : DatabaseTest
    {
        private readonly ITicketRepository _repository;
        private readonly Ticket newTicket;

        public RepositoryTest()
        {
            newTicket = new Ticket
            {
                Id = "6075e868974ac5357820d427",
                UserId = "6074531345581bfd33ca2cd1",
                ConsultantId = "6075562e88483d99268df881",
                Title = "My phone stopped working",
                Description = "My phone stopped working",
                Category = "Hardware",
                Status = "open",
                Priority = "high",
                Date = Convert.ToDateTime("2021-04-12T18:49:43.199+00:00")
            };
            _repository = new TicketRepository(DbContext);
        }

        [Fact]
        public async Task GivenAnTicket_WhenCreateAsync_ThenReturnTicketEntity()
        {
            var result = await _repository.CreateAsync(newTicket);
 
            result.Should().BeOfType<Ticket>();
            result.Status.Should().Be(newTicket.Status);
            result.UserId.Should().Be(newTicket.UserId);
            result.ConsultantId.Should().Be(newTicket.ConsultantId);
            result.Category.Should().Be(newTicket.Category);
            result.Priority.Should().Be(newTicket.Priority);
            result.Date.Should().Be(newTicket.Date);
        }

        [Fact]
        public async Task GivenAListOfTickets_WhenGetAllTickets_ThenReturnListOfTicketEntity()
        {
            var result = await _repository.GetAllAsync();

            result.Should().HaveCount(2);
            result.Should().NotBeEmpty();
            result.Should().BeOfType<List<Ticket>>();
        }

        [Fact]
        public async Task GivenAnId_WhenGetByIdAsync_ThenReturnATicket()
        {
            var result = await _repository.GetByIdAsync("6075e868974ac5357820d428");

            result.Should().BeOfType<Ticket>();
            result.Priority.Should().Be("high");
            result.Should().NotBeNull();
        }

        [Fact]
        public async Task GivenAnId_WhenDeleteAsync_ThenReturnTrue()
        {
            var result = await _repository.DeleteAsync("7075e868974ac5357820d428");

            result.Should().BeTrue();
        }
    }
}
