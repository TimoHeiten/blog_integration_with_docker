using Microsoft.EntityFrameworkCore;

namespace integration_with_docker.src.Context
{
    public class AppDbContext : DbContext
    {
        public DbSet<Models.ApiModel> ApiModels { get; set; }
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base (options)
        { 
            
        }
    }
}