using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using integration_with_docker.src.Context;
using System.Linq;

namespace integration_with_docker.src.Models
{
    public class ApiRepository
    {
        private readonly AppDbContext _context;
        public ApiRepository(AppDbContext context)
        {
            _context = context;
        }

        public IQueryable<ApiModel> GetModels()
            => _context.ApiModels;
        
        public async Task AddAsync(ApiModel model)
        {
            await _context.ApiModels.AddAsync(model);
            await _context.SaveChangesAsync();
        }
    
    }
}