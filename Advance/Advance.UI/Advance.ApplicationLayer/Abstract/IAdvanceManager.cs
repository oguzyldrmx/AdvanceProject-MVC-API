using Advance.DTOs.DTOs.TitleUnitUpperWorkerDTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.AdvanceDTOs;
using Advance.DTOs.DTOs.ProjectDTOs;

namespace Advance.ApplicationLayer.Abstract
{
    public interface IAdvanceManager
    {
        Task<List<AdvanceListDTO>> GetAdvances(int id);
        Task<List<AdvanceDetailDTO>> GetDetails(int id);
        Task<string> AdvanceInsert(AdvanceInsertDTO dto);
        Task<string> AdvanceDetailsInsert(AdvanceDetailsInsertDTO dto);

        Task<List<ProjectDTO>> GetProjectsForWorker(int id);

        Task<List<AdvanceWhoIsApprovingDTO>> GetWhoIsApproving(int id);



    }
}
