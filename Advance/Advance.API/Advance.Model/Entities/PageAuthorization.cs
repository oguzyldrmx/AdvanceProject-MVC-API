using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{

    
    public class PageAuthorization
    {
      
    
        public int PageAuthorizationID { get; set; }
        public string PageAuthrizationName { get; set; }
        public string PageAuthorizationPath { get; set; }
        public string IsActive { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    
    }
}
