using System;
using System.Collections.Generic;
namespace Advance.Model.Entities
{
    
    
    public class AdvanceApproveStatus
    {
        public int ApproveStatusID { get; set; }
        public Nullable<int> AdvanceID { get; set; }
        public Nullable<int> ApproverOrRejecterID { get; set; }
        public Nullable<int> ApprovalStatusID { get; set; }
        public Nullable<System.DateTime> Approved_DeclinedDate { get; set; }
        public Nullable<decimal> ApprovedAmount { get; set; }
    
    
    }
}
