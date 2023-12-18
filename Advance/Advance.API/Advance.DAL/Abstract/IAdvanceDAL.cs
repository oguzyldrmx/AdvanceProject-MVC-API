using Advance.DTOs.DTOs.AdvanceDTOs;
using Advance.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DAL.Abstract
{
    public interface IAdvanceDAL
    {
        Task<List<AdvanceListDTO>> GetAdvances(int workerID);

        Task<List<AdvanceDetailDTO>> GetDetails(int advanceID);

        Task<AdvanceListDTO> GetAdvance(int advanceID);

        Task<int> GetMaxTitleForRule(int id);
        Task<int> AdvanceInsert(AdvanceInsertDTO dto);

        Task<List<AdvanceWhoIsApprovingDTO>> GetWhoIsApproving(int workerID);

        Task<int> AdvanceInsertDetail(AdvanceDetailsInsertDTO dto);
    }
}
