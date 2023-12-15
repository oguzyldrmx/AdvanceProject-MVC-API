using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.DTOs.DTOs.WorkerDTOs;
using Advance.ExceptionHandling.CustomException;
using Advance.Services.ApiConnectServices;

namespace Advance.ApplicationLayer.Concrete
{
    public class WorkerManager:IWorkerManager
    {
        private readonly WorkerConnectService _service;

        public WorkerManager(WorkerConnectService service)
        {
            _service = service;
        }

        public async Task<WorkerLoginDTO> Login(WorkerLoginDTO worker)
        {
            try
            {
                var data = await _service.Login(worker);
                if (data == null)
                {
                    throw new CustomException("Login isleminde hata olustu");
                }

                return data;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public async Task<string> Register(WorkerRegisterDTO worker)
        {
            try
            {
                
                var data = await _service.Register(worker);
                if (data == null)
                {
                    return "Başarısız";
                }

                return "Başarılı";
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
}
