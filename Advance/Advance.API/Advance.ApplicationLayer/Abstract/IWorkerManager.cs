using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Advance.DTOs.DTOs.WorkerDTO;

namespace Advance.ApplicationLayer.Abstract
{
    public interface IWorkerManager
    {
        Task<List<WorkerDTO>> GetWorkers();

        Task<WorkerDTO> GetWorker(int id);

        Task<int> DeleteWorker(int id);

        Task<int> InsertWorker(WorkerInsertDTO workerDto);
        Task<int> UpdateWorker(WorkerUpdateDTO workerDto);
    }
}
