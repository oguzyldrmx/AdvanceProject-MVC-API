using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DTOs.DTOs.WorkerDTOs
{
    public record WorkerRegisterDTO
    {
        public string WorkerName { get; set; }
        public string WorkerEmail { get; set; }
        public string password { get; set; }
        public string WorkerPhonenumber { get; set; }
        public int UpperWorkerID { get; set; }
        public int UnitID { get; set; }
        public int TitleID { get; set; }


    }
}
