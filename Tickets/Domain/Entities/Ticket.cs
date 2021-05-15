using Domain.Common;

namespace Domain.Entities
{
    public class Ticket : BaseEntity {

        public string UserEmail { get; set; }

        public string ConsultantEmail { get; set; }
        public string UserName { get; set; }
        public string ConsultantName { get; set; }
    }
}
