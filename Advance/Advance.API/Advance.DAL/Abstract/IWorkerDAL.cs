using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Advance.DTOs.DTOs.WorkerDTOs;
using Advance.Model.Entities;

namespace Advance.DAL.Abstract
{
    public interface IWorkerDAL
    {
        Task<List<Worker>> GetWorkers();

        Task<Worker> GetWorker(int id);

        Task<int> DeleteWorker(int id);

        Task<int> InsertWorker(WorkerInsertDTO workerDto);
        Task<int> UpdateWorker(WorkerUpdateDTO workerDto);

    }
}
