using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DAL.Abstract;
using Advance.DAL.Context;
using Advance.Model.Entities;
using Dapper;

namespace Advance.DAL.Concrete
{
    public class ProjectDAL:IProjectDAL
    {
        private readonly ConnectionHelper _conn;

        public ProjectDAL(ConnectionHelper conn)
        {
            _conn = conn;
        }

        public async Task<List<Project>> GetProjectsForWorker(int id)
        {
            var query = "select * from Project p left join ProjectWorker pw on pw.ProjectID = p.ProjectID join Worker w on w.WorkerID = pw.WorkerID where w.WorkerID = @id";
            var conn = _conn.CreateConnection();
            var data = await conn.QueryAsync<Project>(query, new { id = id });
            return data.ToList();
        }
    }
}
