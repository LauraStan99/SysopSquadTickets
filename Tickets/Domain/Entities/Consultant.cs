namespace Domain.Entities
{
    public class Consultant
    {
        public string Id { get; set; }
        public string Username { get; set; }
        public string Location { get; set; }
        public string Email { get; set; }
        public byte[] PasswordHash { get; set; }
        public byte[] PasswordSalt { get; set; }
        public int NumberOfTickets { get; set; }
        public string Skill { get; set; }
        public string Availability { get; set; }
    }
}
