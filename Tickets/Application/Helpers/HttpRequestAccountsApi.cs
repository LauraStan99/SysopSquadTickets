using Domain.Entities;
using System;
using System.Net.Http;
using System.Net.Http.Headers;

namespace Application.Helpers
{
    public class HttpRequestAccountsApi
    {
        private readonly HttpClient client;
        public HttpRequestAccountsApi()
        {
            client = new HttpClient
            {
                BaseAddress = new Uri(AppSettings.BaseAddress)
            };
            client.DefaultRequestHeaders.Add("User-Agent", "Anything");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
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

        public void UpdateNoOfTicketsConsultant(string consultantId, int noOfTickets)
        {
            Consultant consultant = new Consultant { Id = consultantId, NumberOfTickets = noOfTickets - 1 };
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
