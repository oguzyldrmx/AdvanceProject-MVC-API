using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DTOs.DTOs.AdvanceDTOs
{
    public record AdvanceInsertDTO
    {
        public decimal AdvanceAmount { get; set; }

        public string AdvanceExplanation { get; set; }

        public DateTime RequestDate { get; set; }

        public DateTime DesiredDate { get; set; }

        public int ProjectID { get; set; }
        public int WorkerID { get; set; }
    }
}
