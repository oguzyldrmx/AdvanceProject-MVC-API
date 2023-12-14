using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
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

            if (datas == null)
            {
                TempData["result"] = "Başarısız";
                return View();
            }

            ViewData["titles"] = datas.Tittles;
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
                TempData["result"] = "Başarısız";
                return View(worker);
            }
            HttpContext.Response.Cookies.Append("token",data.Token,new CookieOptions()
            {
                Expires = DateTimeOffset.Now.AddMinutes(20)
            });

            var claims = new List<Claim>()
            {
                new Claim(ClaimTypes.Name,data.WorkerName),
                new Claim(ClaimTypes.Role,data.TitleName)
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
            var data = await _workerManager.Register(worker);
            if (data == "Başarısız")
            {
                TempData["result"] = data;
                return RedirectToAction("Login","Login");
            }
            TempData["result"] = data;
            return RedirectToAction("Login", "Login");
        }
    }
}
