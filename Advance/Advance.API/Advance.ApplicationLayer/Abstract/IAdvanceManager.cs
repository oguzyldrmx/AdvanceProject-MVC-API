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

        Task<List<AdvanceDetailDTO>> GetDetails(int id);

        Task<AdvanceListDTO> GetAdvance(int id);

        Task<int> GetMaxTitleForRule(int id);
        Task<string> InsertAdvance(AdvanceInsertDTO dto);

        Task<List<AdvanceWhoIsApprovingDTO>> GetWhoIsApproving(int id);

        Task<string> InsertAdvanceDetails(AdvanceDetailsInsertDTO dto);

        Task<string> InsertOMAdvance(AdvanceOMDetailsInsertDTO dto);


    }
}
