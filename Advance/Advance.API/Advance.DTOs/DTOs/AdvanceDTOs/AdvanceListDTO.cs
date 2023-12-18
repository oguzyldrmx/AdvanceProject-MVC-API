using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DTOs.DTOs.AdvanceDTOs
{
    public record AdvanceListDTO
    {
        public int AdvanceID { get; set; }
        public decimal AdvanceAmount { get; set; }
        public DateTime RequestDate { get; set; }
        public DateTime DesiredDate { get; set; }
        
        public int TitleAmountApprovalRuleID { get; set; }

        public string ProjectName { get; set; }
        public string? ApprovalName { get; set; }
        public string? ApprovalRejectedName { get; set; }
        public string? ApprovalRejectedTitle { get; set; }
        public decimal? ApprovedAmount { get; set; }
        public DateTime? ApprovedDeclinedDate { get; set; }
        public DateTime? DeterminedPaybackDate { get; set; }
        public DateTime? PaybackDate { get; set; }
        public string PaybackStatus { get; set; }
    }
}
