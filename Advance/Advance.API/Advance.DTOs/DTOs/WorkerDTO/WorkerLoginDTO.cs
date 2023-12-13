using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DTOs.DTOs.WorkerDTO
{
    public record WorkerLoginDTO
    {
        public string WorkerEmail { get; set; }
        public string password { get; set; }


       
    }
}
