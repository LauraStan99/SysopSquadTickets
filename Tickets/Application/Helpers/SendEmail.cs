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
                Subject = "Ticket status"
            };

            if (status == "Pending")
            {
                mailMessage.Body = "<h1>Welcome " + user.Username + "!</h1>" +
                "<p>Your ticket was created successfully!</p>" +
                "<p>At this moment it has been taken over by one of our consultants. You will receive more information soon.</p>" +
                "<p>Best regards, Sysop Squad Team! </p>";
            }

            if (status == "Open")
            {
                mailMessage.Body = "<h1>Welcome " + user.Username + "!</h1>" +
                "<p>Your problem has been taken over by one of our consultants!</p>" +
                "<p>You will receinve more information as soon as possible.</p>" +
                "<p>Best regards, Sysop Squad Team! </p>";
            }
            
            if (status == "Cancelled")
            {
                mailMessage.Body = "<h1>Welcome " + user.Username + "!</h1>" +
                "<p>Your problem could not be solved by this consultant! We will forward it as soon as possible to find a solution!" +
                "<p>Thank you for your understanding! </p>" +
                "<p>Best regards, Sysop Squad Team! </p>";
            }
          
            mailMessage.IsBodyHtml = true;
            mailMessage.To.Add(user.Email);

            smtpClient.Send(mailMessage);
        }

        public void SendEmailStatusAndMessage(string status,User user, string message)
        {
            var mailMessage = new MailMessage
            {
                From = new MailAddress(config["Smtp:Username"]),
                Subject = "Ticket status",
                Body = "<h1>Welcome " + user.Username + "!</h1>" +
                "<p>Your problem has been solved successfully!</p>" +
                "<p>Message from your consultant: </p>" + message +
                "<p>Thank you for using our services and trust</p>"+
                "<p>Best regards, Sysop Squad Team! </p>"
            };
            mailMessage.IsBodyHtml = true;
            mailMessage.To.Add(user.Email);

            smtpClient.Send(mailMessage);
        }

    }
}
