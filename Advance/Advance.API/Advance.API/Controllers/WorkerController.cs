using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.DTOs.DTOs.WorkerDTO;
using Microsoft.AspNetCore.Mvc;

namespace Advance.API.Controllers
{
    public class WorkerController : Controller
    {
        private readonly IWorkerManager _workerManager;

        public WorkerController(IWorkerManager workerManager)
        {
            _workerManager = workerManager;
        }

        public IActionResult Index()
        {
            return View();
        }
        [HttpGet("getworkers")]
        public async Task<IActionResult> GetWorkers()
        {
            var data = await _workerManager.GetWorkers();
            if(data==null)
                return NotFound();
            return Ok(data);
        }
        [HttpGet("{id}")]
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
        [HttpDelete("delete/{id}")]
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
        [HttpPost("add")]
        public async Task<IActionResult> AddWorker([FromBody]WorkerInsertDTO dto)
        {
            if (dto == null)
                return BadRequest();
            var data = await _workerManager.InsertWorker(dto);
            if (data == 0)
                return BadRequest();
            return Ok(data);
        }
        [HttpPatch("update")]
        public async Task<IActionResult> UpdateWorker([FromBody]WorkerUpdateDTO dto)
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
