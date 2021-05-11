using Application.Interfaces;

namespace Persistence.Context
{
    public class TicketDatabaseSettings : ITicketDatabaseSettings
    {
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
    }
}
