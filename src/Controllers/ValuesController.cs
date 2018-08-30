using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using integration_with_docker.Input;
using integration_with_docker.src.Context;
using integration_with_docker.src.Models;
using Microsoft.AspNetCore.Mvc;

namespace integration_with_docker.src.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private readonly ApiRepository _repository;
        public ValuesController(ApiRepository dbContext)
        {
            _repository = dbContext;
        }

        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<ApiModel>> GetAll()
        {
            var models = _repository.GetModels();
            foreach (var item in models)
            {
                System.Console.WriteLine(item);
            }
            return Ok(models);
            // return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}", Name="MyGet")]
        public IActionResult Get(int? id)
        {
            if (!id.HasValue)
            {
                return NotFound();
            }
            var item = _repository.GetModels().FirstOrDefault(x => x.Id == id);

            if (item != null)
               return Ok(item);
            else
               return NotFound(item);
        }

        // POST api/values
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Model value)
        {
            var model = new ApiModel{ ModelName = value.Identifier , IsModelActive = value.IsActive };
            await _repository.AddAsync(model);
            return RedirectToAction("Get", new { id = model.Id });
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
