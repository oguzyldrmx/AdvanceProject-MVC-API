using Advance.ApplicationLayer.Abstract;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace Advance.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TitleUnitUpperWorkerController : ControllerBase
    {
        private readonly ITitleUnitUpperWorkerManager _manager;

        public TitleUnitUpperWorkerController(ITitleUnitUpperWorkerManager manager)
        {
            _manager = manager;
        }
        [HttpGet("~/api/gettitleunitupperworkers")]
        public async Task<IActionResult> GetTitleUnitUpperWorkers()
        {
            var data = await _manager.GetTitleUnitUpperWorkers();
            if (data==null)
            {
                return null;
            }
            return Ok(data);
        }
    }
}
