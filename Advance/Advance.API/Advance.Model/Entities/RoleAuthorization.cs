using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{
    
    
    public class RoleAuthorization
    {
        public int RoleID { get; set; }
        public int AuthorizationID { get; set; }
        public int PageAuthorizationID { get; set; }
        public string IsActive { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    
       
    }
}
