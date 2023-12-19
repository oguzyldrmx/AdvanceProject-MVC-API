using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DTOs.DTOs.AdvanceDTOs
{
    public record AdvanceOMDetailsInsertDTO
    {
        public int AdvanceID { get; set; }

        public int ApproverOrRejecterID { get; set; }
        public int ApprovalStatusID { get; set; }

        public DateTime ApprovedDeclinedDate { get; set; }

        public decimal ApprovedAmount { get; set; }
        public int TitleID { get; set; }
        public DateTime DeterminedPaymentDate { get; set; }

        public bool ApprovedConfirmed { get; set; }
        public int NextApproverOrRejecterID { get; set; }

        public int ReceiptNo { get; set; }
        public DateTime ReceiptDate { get; set; }

    }
}
