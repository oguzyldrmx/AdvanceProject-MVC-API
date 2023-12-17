using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DTOs.DTOs.AdvanceDTOs
{
    public record AdvanceDetailsInsertDTO
    {
        public int AdvanceID { get; set; }

        public int ApproverOrRejecterID { get; set; }
        public int ApprovalStatusID { get; set; }

        public DateTime ApprovedDeclinedDate { get; set; }

        public decimal ApprovedAmount { get; set; }

        public int NextApproverOrRejecterID { get; set; }
    }
}
