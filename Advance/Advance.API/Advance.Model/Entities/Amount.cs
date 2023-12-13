using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{
   
    
    public class Amount
    {
     
    
        public int AmountID { get; set; }
        public Nullable<decimal> MinAmount { get; set; }
        public Nullable<decimal> MaxAmount { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
    
    }
}
