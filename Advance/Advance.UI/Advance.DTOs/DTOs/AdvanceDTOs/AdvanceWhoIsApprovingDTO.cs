using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DTOs.DTOs.AdvanceDTOs
{
    public record AdvanceWhoIsApprovingDTO
    {
        public int AdvanceID { get; set; }
        public int WorkerID { get; set; }

        public string WorkerName { get; set; }

        public string TitleName { get; set; }
        public string UnitName { get; set; }
        public int ApprovalStatusID { get; set; }

        public string ApprovalName { get; set; }

        public DateTime RequestDate { get; set; }

        public decimal AdvanceAmount { get; set; }

        public DateTime DesiredDate { get; set; }

        public string ProjectName { get; set; }

        public decimal ApprovedAmount { get; set; }

        public string AdvanceExplanation { get; set; }

    }
}
