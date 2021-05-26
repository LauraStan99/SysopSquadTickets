using Application.Interfaces;
using Persistence.Context;
using Persistence.Repository.v1;
using System;

namespace Infrastructure.Tests.Helpers
{
    public class DatabaseTest : IDisposable
    {
        private readonly string dbName = "TicketsTestDatabase";
        public IApplicationDbContext DbContext { get; }
        public ITicketRepository TicketRepository { get; }
      
        public DatabaseTest()
        {
            ConnectionDatabase.DbContextSettings.ConnectionString = ConnectionDatabase.connString;
            ConnectionDatabase.DbContextSettings.DatabaseName = dbName;
            DbContext = new ApplicationDbContext(ConnectionDatabase.DbContextSettings);
            TicketRepository = new TicketRepository(DbContext);
          
        }

        public void Dispose()
        {
            DbContext.Client.GetDatabase(dbName).DropCollection("Tickets");
         
        }
    }
}
