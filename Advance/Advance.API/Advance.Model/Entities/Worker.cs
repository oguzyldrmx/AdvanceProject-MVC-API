using System;
using System.Collections.Generic;

namespace Advance.Model.Entities
{

    
    public class Worker
    {
        public int WorkerID { get; set; }
        public string WorkerName { get; set; }
        public string WorkerEmail { get; set; }
        public string WorkerPhonenumber { get; set; }
        public Nullable<int> UnitID { get; set; }

        public Unit Unit { get; set; }
        public Nullable<int> TitleID { get; set; }

        public Title Title { get; set; }
        public Nullable<int> UpperWorkerID { get; set; }
        public byte[] PasswordSalt { get; set; }
        public byte[] PasswordHash { get; set; }
    
    }
}
