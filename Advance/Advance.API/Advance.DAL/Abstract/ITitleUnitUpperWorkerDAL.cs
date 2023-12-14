using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.TitleUnitUpperWorkerDTOs;

namespace Advance.DAL.Abstract
{
    public interface ITitleUnitUpperWorkerDAL
    {
        Task<TitleUnitUpperWorkerDTO> GetTitleUnitUpperWorkers();
    }
}
