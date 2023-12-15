using Advance.ApplicationLayer.Abstract;
using Advance.ApplicationLayer.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace Advance.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdvanceController : ControllerBase
    {
        private readonly IAdvanceManager _advanceManager;

        public AdvanceController(IAdvanceManager advanceManager)
        {
            _advanceManager = advanceManager;
        }

        [HttpGet("~/api/getadvances")]
        public async Task<IActionResult> GetAdvances(int id)
        {
            var data = await _advanceManager.GetAdvances(id);
            if (data == null)
                return NotFound();
            return Ok(data);
        }
    }
}
