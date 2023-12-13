using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{
    
    
    public class TitleAmountApprovalRule
    {
       
    
        public int ID { get; set; }
        public Nullable<int> AmountID { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<int> TitleID { get; set; }
    
        
    }
}
