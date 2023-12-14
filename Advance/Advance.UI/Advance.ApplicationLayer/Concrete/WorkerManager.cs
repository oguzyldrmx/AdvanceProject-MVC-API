using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.DTOs.DTOs.WorkerDTOs;
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
            var data = await _service.Login(worker);
            if (data == null)
            {
                return null;
            }

            return data;
        }

        public async Task<string> Register(WorkerRegisterDTO worker)
        {
            var data = await _service.Register(worker);
            if (data == null)
            {
                return "Başarısız";
            }

            return "Başarılı";
        }
    }
}
