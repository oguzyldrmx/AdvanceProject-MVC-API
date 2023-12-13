using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{
    
    
    public class Authorization
    {
      
    
        public int AuthorizationID { get; set; }
        public string AutherizationPath { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public bool IsActive { get; set; }
    
        
    }
}
