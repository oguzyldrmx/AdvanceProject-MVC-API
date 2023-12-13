using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{

    
    public class Report
    {
        public int ReportID { get; set; }
        public Nullable<int> WorkerID { get; set; }
        public Nullable<int> AdvanceID { get; set; }
        public string IsActive { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
    
    }
}
