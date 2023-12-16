using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.ProjectDTOs;

namespace Advance.ApplicationLayer.Abstract
{
    public interface IProjectManager
    {
        Task<List<ProjectDTO>> GetProjectsForWorker(int id);
    }
}
