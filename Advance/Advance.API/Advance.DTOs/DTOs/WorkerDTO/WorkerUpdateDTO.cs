﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DTOs.DTOs.WorkerDTO
{
    public class WorkerUpdateDTO
    {
        public int WorkerID { get; set; }
        public string WorkerName { get; set; }
        public string WorkerEmail { get; set; }
        public string WorkerPhonenumber { get; set; }
        public int UpperWorkerID { get; set; }
        public int UnitID { get; set; }
        public int TitleID { get; set; }
    }
}