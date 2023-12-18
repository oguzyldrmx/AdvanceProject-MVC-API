using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.ApplicationLayer.Validations.Worker;
using Advance.DTOs.DTOs.WorkerDTOs;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Advance.UI.Controllers
{
    public class LoginController : Controller
    {
        private readonly IWorkerManager _workerManager;
        private readonly ITitleUnitUpperWorkerManager _titleUnitUpperWorkerManager;
        public LoginController(IWorkerManager workerManager, ITitleUnitUpperWorkerManager titleUnitUpperWorkerManager)
        {
            _workerManager = workerManager;
            _titleUnitUpperWorkerManager = titleUnitUpperWorkerManager;
        }

        [HttpGet]
        public async Task<IActionResult> Login()
        {
            var datas = await _titleUnitUpperWorkerManager.GetTitleUnitUpperWorkers();
            ViewData["titles"] = datas.Titles;
            ViewData["units"] = datas.Units;
            ViewData["upperworkers"] = datas.UpperWorkers;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(WorkerLoginDTO worker)
        {
            var data = await _workerManager.Login(worker);
            if (data == null)
            {
                var datas = await _titleUnitUpperWorkerManager.GetTitleUnitUpperWorkers();
                TempData["result"] = "Başarısız";
                ViewData["titles"] = datas.Titles;
                ViewData["units"] = datas.Units;
                ViewData["upperworkers"] = datas.UpperWorkers;
                return View(worker);
            }
            HttpContext.Response.Cookies.Append("token",data.Token,new CookieOptions()
            {
                
                Expires = DateTimeOffset.Now.AddMinutes(20)
            });

            var claims = new List<Claim>()
            {
                new Claim(ClaimTypes.Email,data.WorkerEmail),
                new Claim(ClaimTypes.NameIdentifier,data.WorkerID.ToString()),
                new Claim(ClaimTypes.Name,data.WorkerName),
                new Claim(ClaimTypes.Role,data.TitleName),
                new Claim(ClaimTypes.UserData,data.UpperWorkerID.ToString()),
                new Claim(ClaimTypes.Actor,data.TitleID.ToString())
            };
            var identity = new ClaimsIdentity(claims, "login");
            var principal = new ClaimsPrincipal(identity);
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);
           
            return RedirectToAction("Index", "Home");
        }

      


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(WorkerRegisterDTO worker)
        {
            var validator = new WorkerRegisterValidator();
            var validationResult = validator.Validate(worker);
            if (!validationResult.IsValid)
            {
                foreach (var error in validationResult.Errors)
                {
                    ModelState.AddModelError(error.PropertyName, error.ErrorMessage);
                }

                TempData["ValidationErrors"] = validationResult.Errors.Select(e => e.ErrorMessage).ToList();
                //return View();
                return RedirectToAction("Login", "Login");
            }
            var data = await _workerManager.Register(worker);

            TempData["result"] = data;
            return RedirectToAction("Login", "Login");
        }

        [HttpGet]
        public async Task<IActionResult> Logout()
        {
           
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

           
            return RedirectToAction("Login", "Login");
        }
    }
}
