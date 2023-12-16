using Advance.ApplicationLayer.Abstract;
using Advance.DTOs.DTOs.WorkerDTOs;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace Advance.API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class WorkerController : ControllerBase
    {
        private readonly IWorkerManager _workerManager;

        public WorkerController(IWorkerManager workerManager)
        {
            _workerManager = workerManager;
        }


        [HttpGet("~/api/getworkers")]
        public async Task<IActionResult> GetWorkers()
        {
            var data = await _workerManager.GetWorkers();
            if (data == null)
                return NotFound();
            return Ok(data);
        }

        [HttpGet("~/api/{id}")]
        public async Task<IActionResult> GetWorker(int id)
        {
            if (id <= 0)
            {
                return NotFound();
            }

            var data = await _workerManager.GetWorker(id);
            if (data == null)
                return NotFound();
            return Ok(data);
        }

        [HttpDelete("~/api/delete/{id}")]
        public async Task<IActionResult> DeleteWorker(int id)
        {
            if (id <= 0)
            {
                return NotFound();
            }

            var data = await _workerManager.DeleteWorker(id);
            if (data == 0)
                return BadRequest();
            return Ok(data);
        }

        [HttpPost("~/api/add")]
        public async Task<IActionResult> AddWorker([FromBody] WorkerInsertDTO dto)
        {
            if (dto == null)
                return BadRequest();
            var data = await _workerManager.InsertWorker(dto);
            if (data == 0)
                return BadRequest();
            return Ok(data);
        }

        [HttpPatch("~/api/update")]
        public async Task<IActionResult> UpdateWorker([FromBody] WorkerUpdateDTO dto)
        {
            if (dto == null)
                return BadRequest();
            var data = await _workerManager.UpdateWorker(dto);
            if (data == 0)
                return BadRequest();
            return Ok(data);
        }
    }
}
