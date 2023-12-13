using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{

    
    public class Project
    {
       
    
        public int ProjectID { get; set; }
        public string ProjectName { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public string ProjectExplanation { get; set; }
    
    }
}
