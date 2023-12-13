using Advance.ApplicationLayer.Abstract;
using Advance.DTOs.DTOs.WorkerDTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace Advance.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TokenController : ControllerBase
    {
        private readonly IAuthManager _authManager;

        public TokenController(IAuthManager authManager)
        {
            _authManager = authManager;
        }
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] WorkerLoginDTO worker)
        {

            var data = await _authManager.Login(worker);
            return Ok(data);

        }
        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] WorkerRegisterDTO worker)
        {

            var data = await _authManager.Register(worker);
            return Ok(data);

        }


    }
}
