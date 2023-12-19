using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.ApplicationLayer.Concrete;
using Microsoft.AspNetCore.Authorization;

namespace Advance.API.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class ProjectController : ControllerBase
    {
        private readonly IProjectManager _projectManager;

        public ProjectController(IProjectManager projectManager)
        {
            _projectManager = projectManager;
        }

        [HttpGet("~/api/getprojects/{id}")]
        public async Task<IActionResult> GetProjects(int id)
        {
            if (id <= 0)
            {
                return NotFound();
            }

            var data = await _projectManager.GetProjectsForWorker(id);
            if (data == null)
                return NotFound();
            return Ok(data);
        }
    }
}
