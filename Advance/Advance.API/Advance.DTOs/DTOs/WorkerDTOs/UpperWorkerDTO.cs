﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DTOs.DTOs.WorkerDTOs
{
    public record UpperWorkerDTO
    {
        public int WorkerID { get; set; }
        public string WorkerName { get; set; }
    }
}
