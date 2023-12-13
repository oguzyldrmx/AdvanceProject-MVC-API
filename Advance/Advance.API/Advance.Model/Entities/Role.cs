using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{

    
    public class Role
    {
     
    
        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    
    }
}
