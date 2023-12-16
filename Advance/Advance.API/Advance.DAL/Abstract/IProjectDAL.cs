using Advance.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DAL.Abstract
{
    public interface IProjectDAL
    {
        Task<List<Project>> GetProjectsForWorker(int id);
    }
}
