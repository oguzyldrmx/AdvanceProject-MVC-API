using Advance.ApplicationLayer.Abstract;
using Advance.ApplicationLayer.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.AdvanceDTOs;
using Microsoft.AspNetCore.Authorization;

namespace Advance.API.Controllers
{
    //[Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AdvanceController : ControllerBase
    {
        private readonly IAdvanceManager _advanceManager;

        public AdvanceController(IAdvanceManager advanceManager)
        {
            _advanceManager = advanceManager;
        }

        [HttpGet("~/api/getadvances/{id}")]
        public async Task<IActionResult> GetAdvances(int id)
        {
            var data = await _advanceManager.GetAdvances(id);
            if (data == null)
                return NotFound();
            return Ok(data);
        }

        [HttpGet("~/api/getdetails/{id}")]
        public async Task<IActionResult> GetDetails(int id)
        {
            var data = await _advanceManager.GetDetails(id);
            if (data == null)
                return NotFound();

            return Ok(data);
        }

        [HttpPost("~/api/advanceinsert")]
        public async Task<string> AdvanceInsert([FromBody] AdvanceInsertDTO dto)
        {
            var data = await _advanceManager.InsertAdvance(dto);
           
            return data;
        }
    }
}
