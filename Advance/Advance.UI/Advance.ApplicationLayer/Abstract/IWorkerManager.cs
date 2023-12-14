using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.WorkerDTOs;

namespace Advance.ApplicationLayer.Abstract
{
    public interface IWorkerManager
    {
        Task<WorkerLoginDTO> Login(WorkerLoginDTO worker);

        Task<string> Register(WorkerRegisterDTO worker);
    }
}
