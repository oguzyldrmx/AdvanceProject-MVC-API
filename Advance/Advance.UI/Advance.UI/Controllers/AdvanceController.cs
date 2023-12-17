using Advance.ApplicationLayer.Abstract;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.AdvanceDTOs;

namespace Advance.UI.Controllers
{
    public class AdvanceController : Controller
    {
        private readonly IAdvanceManager advanceManager;

        public AdvanceController(IAdvanceManager advanceManager)
        {
            this.advanceManager = advanceManager;
        }

        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> GetAdvances()
        {
            var data = await advanceManager.GetAdvances(int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value));

            ViewBag.advances = data;

            return View();
        }

        [HttpGet]
        public async Task<IActionResult> GetDetails(int id)
        {
            var data = await advanceManager.GetDetails(id);

            ViewBag.details = data;

            return View();
        }

       


        [HttpGet]
        public async Task<IActionResult> AdvanceInsert()
        {
            var data = await advanceManager.GetProjectsForWorker(int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value));
            ViewData["projectList"] = data;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AdvanceInsert(AdvanceInsertDTO dto)
        {
            var data = await advanceManager.AdvanceInsert(dto);
           
            TempData["result"] = data;
            return RedirectToAction("AdvanceInsert");
        }

      

       

        [HttpGet]
        public async Task<IActionResult> GetBMApprovePage()
        {
            var data = await advanceManager.GetWhoIsApproving(
                int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value));
            ViewData["projectList"] = data;
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> GetBMApprovePageDetails()
        {
            var data = await advanceManager.GetWhoIsApproving(
                int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value));
            ViewData["projectList"] = data;

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GetBMApprovePageDetails(AdvanceDetailsInsertDTO dto)
        {
            var data = await advanceManager.AdvanceDetailsInsert(dto);
            
            TempData["result"] = data;
            return RedirectToAction("GetBMApprovePageDetails");
        }
    }
}
