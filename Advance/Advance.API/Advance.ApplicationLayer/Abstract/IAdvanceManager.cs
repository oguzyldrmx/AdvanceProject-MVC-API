using Advance.DTOs.DTOs.WorkerDTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.AdvanceDTOs;

namespace Advance.ApplicationLayer.Abstract
{
    public interface IAdvanceManager
    {
        Task<List<AdvanceListDTO>> GetAdvances(int id);
    }
}
