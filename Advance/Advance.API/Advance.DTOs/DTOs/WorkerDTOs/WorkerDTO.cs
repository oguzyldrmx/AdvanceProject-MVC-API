﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.TitleDTOs;
using Advance.DTOs.DTOs.UnitDTOs;

namespace Advance.DTOs.DTOs.WorkerDTOs
{
    public record WorkerDTO
    {
        public int WorkerID { get; set; }
        public string WorkerName { get; set; }
        public string WorkerEmail { get; set; }
        public string WorkerPhonenumber { get; set; }
        public int UpperWorkerID { get; set; }
        public byte[] PasswordSalt { get; set; }
        public byte[] PasswordHash { get; set; }
        public UnitDTO UnitDTO { get; set; }
       

        public TitleDTO TitleDTO { get; set; }
        
        
    }
}
