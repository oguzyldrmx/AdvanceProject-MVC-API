using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DAL.Abstract;
using Advance.DAL.Context;
using Advance.DTOs.DTOs.AdvanceDTOs;
using Advance.Model.Entities;
using Dapper;

namespace Advance.DAL.Concrete
{
    public class AdvanceDAL:IAdvanceDAL
    {
        private readonly ConnectionHelper _con;

        public AdvanceDAL(ConnectionHelper con)
        {
            _con = con;
        }

        public async Task<List<AdvanceListDTO>> GetAdvances(int workerID)
        {
            if(workerID == 0) return null;
          
            using var conn = _con.CreateConnection();

         

            var data = await conn.QueryAsync<AdvanceListDTO>("SP_GetWorkerAdvances", new { workerId = workerID }, commandType: CommandType.StoredProcedure);
            return data.ToList();
        }
    }
}
