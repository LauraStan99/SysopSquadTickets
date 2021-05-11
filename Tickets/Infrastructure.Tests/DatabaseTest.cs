using Application.Interfaces;
using Domain.Entities;
using Persistence.Context;
using System;

namespace Infrastructure.Tests
{
    public class DatabaseTest : IDisposable
    {
        private readonly TicketDatabaseSettings DbContextSettings = new TicketDatabaseSettings();
        private readonly string connString = "mongodb+srv://laura:1234@cluster0.pratu.mongodb.net/test?authSource=admin&replicaSet=atlas-1f4lzo-shard-0&readPreference=primary&appname=MongoDB%20Compass&ssl=true";

        private readonly string dbName = "TestDatabase";
        protected IApplicationDbContext DbContext { get; }

        public DatabaseTest()
        {
            this.DbContextSettings.ConnectionString = connString;
            this.DbContextSettings.DatabaseName = dbName;
            this.DbContext = new ApplicationDbContext(this.DbContextSettings);
            DatabaseInitializer.Initialize(DbContext);
        }

        public void Dispose()
        {
            this.DbContext.Client.GetDatabase(this.dbName).DropCollection(typeof(Ticket).Name + "s");
        }
    }
}
