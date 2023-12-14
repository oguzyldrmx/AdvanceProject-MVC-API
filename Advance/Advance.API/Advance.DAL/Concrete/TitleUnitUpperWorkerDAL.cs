using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DAL.Abstract;
using Advance.DAL.Context;
using Advance.DTOs.DTOs.TitleDTOs;
using Advance.DTOs.DTOs.UnitDTOs;
using Advance.DTOs.DTOs.WorkerDTOs;
using Advance.DTOs.TitleUnitUpperWorkerDTOs;
using Dapper;

namespace Advance.DAL.Concrete
{
    public class TitleUnitUpperWorkerDAL:ITitleUnitUpperWorkerDAL
    {
        private readonly ConnectionHelper _connectionHelper;

        public TitleUnitUpperWorkerDAL(ConnectionHelper connectionHelper)
        {
            _connectionHelper = connectionHelper;
        }

        public async Task<TitleUnitUpperWorkerDTO> GetTitleUnitUpperWorkers()
        {
            var Units = "select * from Unit";
            var Titles = "select * from Title";
            var UpperWorkers = "select * from Worker";

            using var conn = _connectionHelper.CreateConnection();
            var data = new TitleUnitUpperWorkerDTO()
            {
                Tittles = conn.Query<TitleDTO>(Titles).ToList(),
                Units = conn.Query<UnitDTO>(Units).ToList(),
                UpperWorkers = conn.Query<UpperWorkerDTO>(UpperWorkers).ToList()
            };
            return data;
        }
    }
}
