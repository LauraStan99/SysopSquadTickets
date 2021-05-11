using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Persistence.Context;
using Application.Interfaces;
using MongoDB.Driver;
using Microsoft.Extensions.Options;
using Persistence.Repository.v1;

namespace Persistence
{
    public static class DependencyInjection
    {
        public static void AddPersistence(this IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<TicketDatabaseSettings>(configuration.GetSection("TicketDatabaseSettings"));

            services.AddSingleton<ITicketDatabaseSettings>(sp =>
                sp.GetRequiredService<IOptions<TicketDatabaseSettings>>().Value);

            services.AddScoped<IApplicationDbContext, ApplicationDbContext>();
            services.AddScoped<ITicketRepository, TicketRepository>();


            var mongoCon = configuration.GetSection("TicketDatabaseSettings")["ConnectionString"];
            services.AddSingleton<IMongoClient>(new MongoClient(mongoCon));

        }
    }
}
