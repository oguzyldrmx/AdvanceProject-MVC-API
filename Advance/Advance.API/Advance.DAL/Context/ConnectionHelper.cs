using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace Advance.DAL.Context
{
    public class ConnectionHelper
    {
        private readonly IConfiguration _conf;

        public ConnectionHelper(IConfiguration conf)
        {
            _conf = conf;
        }

        public IDbConnection CreateConnection()
        {
            return new SqlConnection(_conf.GetConnectionString("myconn"));
        }
    }
}
