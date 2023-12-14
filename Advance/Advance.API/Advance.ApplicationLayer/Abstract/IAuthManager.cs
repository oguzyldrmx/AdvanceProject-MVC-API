using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.WorkerDTOs;
using Advance.Model.Entities;

namespace Advance.ApplicationLayer.Abstract
{
    public interface IAuthManager
    {
        Task<WorkerLoginDTO> Login(WorkerLoginDTO worker);

        Task<WorkerRegisterDTO> Register(WorkerRegisterDTO user);
    }
}
