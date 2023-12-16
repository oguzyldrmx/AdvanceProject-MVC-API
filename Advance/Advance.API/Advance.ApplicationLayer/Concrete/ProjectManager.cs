using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.ApplicationLayer.Mapper;
using Advance.DAL.Abstract;
using Advance.DTOs.DTOs.ProjectDTOs;
using Advance.Model.Entities;

namespace Advance.ApplicationLayer.Concrete
{
    public class ProjectManager:IProjectManager
    {
        private readonly IProjectDAL _dal;
        private readonly MyMapper mapper;

        public ProjectManager(IProjectDAL dal, MyMapper mapper)
        {
            _dal = dal;
            this.mapper = mapper;
        }

        public async Task<List<ProjectDTO>> GetProjectsForWorker(int id)
        {
            try
            {
                return (mapper.Map<List<ProjectDTO>, List<Project>>(await _dal.GetProjectsForWorker(id) ));
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
