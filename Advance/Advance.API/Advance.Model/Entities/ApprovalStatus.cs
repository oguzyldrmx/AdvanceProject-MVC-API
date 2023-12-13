using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{
    
    
    public class ApprovalStatus
    {
       
    
        public int ApprovalStatusID { get; set; }
        public string ApprovalName { get; set; }
        public string NextApprovalName { get; set; }
        public string IsActive { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    
       
    }
}
