using Domain.Entities;
using Microsoft.Extensions.Configuration;
using System.Net;
using System.Net.Mail;

namespace Application.Helpers
{
    public class SendEmail
    {
        private readonly SmtpClient smtpClient;
        private readonly IConfiguration config;
        public SendEmail()
        {
            var builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
            config = builder.Build();

            smtpClient = new SmtpClient(config["Smtp:Host"])
            {
                Port = int.Parse(config["Smtp:Port"]),
                Credentials = new NetworkCredential(config["Smtp:Username"], config["Smtp:Password"]),
                EnableSsl = true,
            };
        }

        public void SendEmailStatus(string status, User user)
        {
            var mailMessage = new MailMessage
            {
                From = new MailAddress(config["Smtp:Username"]),
                Subject = "Ticket status",
                Body = "<h1>Welcome " + user.Username+ "!</h1>"+
                "<p>Your ticket status is now " + status + "</p>",
                IsBodyHtml = true,
            };
            mailMessage.To.Add(user.Email);

            smtpClient.Send(mailMessage);
        }

        public void SendEmailStatusAndMessage(string status, User user, string message)
        {
            var mailMessage = new MailMessage
            {
                From = new MailAddress(config["Smtp:Username"]),
                Subject = "Ticket status",
                Body = "<h1>Welcome " + user.Username + "!</h1>" +
                "<p>Your ticket status is now " + status + "</p>"+
                "<p>" + message + "</p>",
                IsBodyHtml = true,
            };
            mailMessage.To.Add(user.Email);

            smtpClient.Send(mailMessage);
        }

    }
}
