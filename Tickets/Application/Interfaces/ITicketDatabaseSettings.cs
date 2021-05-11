namespace Application.Interfaces
{
    public interface ITicketDatabaseSettings
    {
        string ConnectionString { get; set; }
        string DatabaseName { get; set; }
    }
}
