using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{
    
    
    public class Title
    {
      
    
        public int TitleID { get; set; }
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }
        public Nullable<int> RoleID { get; set; }
    
       
    }
}
