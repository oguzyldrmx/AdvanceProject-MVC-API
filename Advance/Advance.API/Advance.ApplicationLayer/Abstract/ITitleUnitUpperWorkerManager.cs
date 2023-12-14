using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.TitleUnitUpperWorkerDTOs;

namespace Advance.ApplicationLayer.Abstract
{
    public interface ITitleUnitUpperWorkerManager
    {
        Task<TitleUnitUpperWorkerDTO> GetTitleUnitUpperWorkers();
    }
}
