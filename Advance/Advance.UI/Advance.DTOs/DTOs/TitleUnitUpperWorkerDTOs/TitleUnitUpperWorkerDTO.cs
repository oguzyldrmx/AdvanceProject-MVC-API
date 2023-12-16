using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.WorkerDTOs;
using Advance.DTOs.DTOs.TitleDTOs;
using Advance.DTOs.DTOs.UnitDTOs;

namespace Advance.DTOs.DTOs.TitleUnitUpperWorkerDTOs
{
    public record TitleUnitUpperWorkerDTO
    {
        public List<UnitDTO> Units { get; set; }
        public List<TitleDTO> Titles { get; set; }
        public List<UpperWorkerDTO> UpperWorkers { get; set; }
    }
}
