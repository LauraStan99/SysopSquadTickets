using System.Net.Sockets;
using System.Net.Security;
using System.Security.Claims;
using System.Net.WebSockets;
using Domain.Entities;
using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Authentication;

namespace Application.Helpers
{
    public class HttpRequestAccountsApi
    {
        private readonly HttpClient client;
        public HttpRequestAccountsApi(string token)
        {
            // var handler = new HttpClientHandler();
            // handler.SslProtocols = SslProtocols.Tls12;
            client = new HttpClient();
            client.BaseAddress = new Uri(AppSettings.BaseAddress);
            client.DefaultRequestHeaders.Add("User-Agent", "Anything");
            client.DefaultRequestHeaders.Add("Authorization", "Bearer " + token);
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            // client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
        }
 
        public User GetUserById(string userId)
        {
            var response = client.GetAsync("api/v1/Users/" + userId).Result;
            response.EnsureSuccessStatusCode();
            var result = response.Content.ReadAsAsync<User>().Result;
            return result;
        }

        public Consultant GetConsultantById(string consultantId)
        {
            var response = client.GetAsync("api/v1/Consultants/" + consultantId).Result;
            response.EnsureSuccessStatusCode();
            var result = response.Content.ReadAsAsync<Consultant>().Result;
            return result;
        }

        public Consultant GetBestConsultant(string category, string location)
        {
            var response = client.GetAsync("api/v1/Consultants/best?skill=" + category + "&location=" + location).Result;
            response.EnsureSuccessStatusCode();
            var result = response.Content.ReadAsAsync<Consultant>().Result;
            return result;
        }

        public void UpdateNoOfTicketsConsultant(string consultantId, int noOfTickets, int totalNoOfTickets)
        {
            Consultant consultant = new Consultant { Id = consultantId, NumberOfTickets = noOfTickets - 1, TotalNumberOfTickets = totalNoOfTickets + 1};
            var response = client.PutAsJsonAsync("api/v1/Consultants", consultant).Result;
            response.EnsureSuccessStatusCode();
        }

        public void UpdateSolvedNoOfTicketsConsultant(string consultantId, int solvedNoOfTickets)
        {
            Consultant consultant = new Consultant { Id = consultantId, SolvedNumberOfTickets = solvedNoOfTickets + 1 };
            var response = client.PutAsJsonAsync("api/v1/Consultants", consultant).Result;
            response.EnsureSuccessStatusCode();
        }

        public void IncreaseNoOfTicketsConsultant(string consultantId, int noOfTickets)
        {
            Consultant consultant = new Consultant { Id = consultantId, NumberOfTickets = noOfTickets + 1 };
            var response = client.PutAsJsonAsync("api/v1/Consultants", consultant).Result;
            response.EnsureSuccessStatusCode();
        }
    }
}
