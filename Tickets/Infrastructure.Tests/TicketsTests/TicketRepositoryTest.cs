using Application.Interfaces;
using System.Threading.Tasks;
using FluentAssertions;
using Xunit;
using Tests.Helpers;
using Domain.Entities;
using Infrastructure.Tests.Helpers;
using System.Linq;
using System.Collections.Generic;

namespace Infrastructure.Tests.TicketsTests
{
    [Collection("Database collection")]
    public class TicketRepositoryTest
    {

        private readonly ITicketRepository _repository;
        private readonly DatabaseTest _database;

        public TicketRepositoryTest(DatabaseTest databaseTest)
        {
            _database = databaseTest;
            _repository = _database.TicketRepository;
        }


        [Fact]
        public async Task GivenATicket_WhenCreateAsync_ThenReturnTicketEntity()
        {
            var ticket = TicketsFactory.ValidTicket();


            var result = await _repository.CreateAsync(ticket);

            result.Should().BeOfType<Ticket>();            
        }

        [Fact]
        public async Task GivenAListOfTickets_WhenGetAllTickets_ThenReturnListOfTicketsEntity()
        {
            var ticket = TicketsFactory.Added2Tickets(_database.DbContext);

            var result = await _repository.GetAllAsync();

            result.Should().BeOfType<List<Ticket>>();
            var addedTicket = result.FirstOrDefault(u => u.Id == ticket.Id);
            addedTicket.Should().NotBeNull();

        }

        [Fact]
        public async Task GivenAnId_WhenGetByIdAsync_ThenReturnAnTicket()
        {
            var ticket = TicketsFactory.AddedTicket(_database.DbContext);

            var result = await _repository.GetByIdAsync(ticket.Id);

            result.Should().NotBeNull();
            result.Should().BeOfType<Ticket>();
        }

        [Fact]
        public async Task GivenAnUserIdAndConsultantId_WhenGetByUserIdAndConsultantIdAsync_ThenReturnAnTicket()
        {
            var ticket = TicketsFactory.AddedTicket(_database.DbContext);

            var result = await _repository.GetByUserIdAndConsultantIdAsync(ticket.UserId,ticket.ConsultantId);

            result.Should().NotBeNull();
            result.Should().BeOfType<Ticket>();
        }




        [Fact]
        public async Task GivenAnUserId_WhenGetAllByUserIdAsync_ThenReturnAnListOfTickets()
        {
            var ticket = TicketsFactory.Added2Tickets(_database.DbContext);

            var result = await _repository.GetAllByUserIdAsync(ticket.UserId);

            result.Should().BeOfType<List<Ticket>>();
            var addedTicket = result.FirstOrDefault(u => u.UserId == ticket.UserId);
            addedTicket.Should().NotBeNull();
        }
        [Fact]
        public async Task GivenAnConsultantId_WhenGetAllByConsultantIdAsync_ThenReturnAnListOfTickets()
        {
            var ticket = TicketsFactory.Added2Tickets(_database.DbContext);

            var result = await _repository.GetAllByConsultantIdAsync(ticket.ConsultantId);

            result.Should().BeOfType<List<Ticket>>();
            var addedTicket = result.FirstOrDefault(u => u.ConsultantId == ticket.ConsultantId);
            addedTicket.Should().NotBeNull();

        }
        [Fact]
        public async Task GivenAnStatus_WhenGetAllByStatusAsync_ThenReturnAnListOfTickets()
        {
            var ticket = TicketsFactory.Added2Tickets(_database.DbContext);

            var result = await _repository.GetAllByStatusAsync(ticket.Status);

            result.Should().BeOfType<List<Ticket>>();
            var addedTicket = result.FirstOrDefault(u => u.Status == ticket.Status);
            addedTicket.Should().NotBeNull();
        }

        [Fact]
        public async Task GivenAnInexistentId_WhenGetByIdAsync_ThenReturnNull()
        {
            var ticket = TicketsFactory.ValidTicket();

            var result = await _repository.GetByIdAsync(ticket.Id);

            result.Should().BeNull();
        }

        [Fact]
        public async Task GivenAnId_WhenDeleteAsync_ThenReturnTrue()
        {
            var ticket = TicketsFactory.AddedTicket(_database.DbContext);

            var result = await _repository.DeleteAsync(ticket.Id);

            result.Should().BeTrue();
        }

        [Fact]
        public async Task GivenAnInexistentId_WhenDeleteAsync_ThenReturnFalse()
        {
            var ticket = TicketsFactory.ValidTicket();

            var result = await _repository.DeleteAsync(ticket.Id);

            result.Should().BeFalse();
        }

        [Fact]
        public async Task GivenATicket_WhenUpdate_ThenReturnTicketUpdated()
        {
            var ticket = TicketsFactory.AddedTicket(_database.DbContext);
            var updatedTicket = TicketsFactory.UpdateValidTicket(ticket.UserId, ticket.ConsultantId);

            var result = await _repository.UpdateAsync(updatedTicket);

            result.Should().BeOfType<Ticket>();
           
        }
        

        

       


    }
}
