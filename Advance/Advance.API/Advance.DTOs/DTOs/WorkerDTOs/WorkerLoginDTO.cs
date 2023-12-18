using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DTOs.DTOs.WorkerDTOs
{
    public record WorkerLoginDTO
    {
        public int WorkerID { get; set; }
        public string WorkerEmail { get; set; }
        public string password { get; set; }
        public int TitleID { get; set; }

        public int UpperWorkerID { get; set; }
        public string WorkerName { get; set; }
        public string Token { get; set; }

        public string TitleName { get; set; }

    }
}
