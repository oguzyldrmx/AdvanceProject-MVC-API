using System;
using System.Collections.Generic;


namespace Advance.Model.Entities
{
   
    
    public class Advance
    {
      
        public int AdvanceID { get; set; }
        public Nullable<int> TitleAmountApprovalRuleID { get; set; }
        public Nullable<decimal> AdvanceAmount { get; set; }
        public string AdvanceExplanation { get; set; }
        public Nullable<int> WorkerID { get; set; }
        public Nullable<DateTime> RequestDate { get; set; }
        public Nullable<DateTime> DesiredDate { get; set; }
        public Nullable<bool> isApproved { get; set; }
        public Nullable<int> ProjectID { get; set; }
    
       
    }
}
