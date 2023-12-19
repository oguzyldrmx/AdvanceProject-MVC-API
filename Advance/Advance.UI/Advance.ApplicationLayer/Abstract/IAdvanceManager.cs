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
        Task<List<AdvanceListDTO>> GetAdvances(int id, string token);
        Task<List<AdvanceDetailDTO>> GetDetails(int id, string token);
        Task<string> AdvanceInsert(AdvanceInsertDTO dto, string token );
        Task<string> AdvanceOMInsert(AdvanceOMDetailsInsertDTO dto, string token );
        Task<string> AdvanceDetailsInsert(AdvanceDetailsInsertDTO dto, string token);

        Task<List<ProjectDTO>> GetProjectsForWorker(int id, string token);

        Task<List<AdvanceWhoIsApprovingDTO>> GetWhoIsApproving(int id);



    }
}
