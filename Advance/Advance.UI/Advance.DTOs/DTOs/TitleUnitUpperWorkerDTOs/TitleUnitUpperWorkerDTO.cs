using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.WorkerDTOs;
using Advance.DTOs.TitleDTOs;
using Advance.DTOs.UnitDTOs;

namespace Advance.DTOs.TitleUnitUpperWorkerDTOs
{
    public record TitleUnitUpperWorkerDTO
    {
        public List<UnitDTO> Units { get; set; }
        public List<TitleDTO> Tittles { get; set; }
        public List<UpperWorkerDTO> UpperWorkers { get; set; }
    }
}
