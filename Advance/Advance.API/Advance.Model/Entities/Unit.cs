using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{

    
    public class Unit
    {
      
    
        public int UnitID { get; set; }
        public string UnitName { get; set; }
        public string UnitExplanation { get; set; }
        public Nullable<bool> IsActive { get; set; }
    
    }
}
