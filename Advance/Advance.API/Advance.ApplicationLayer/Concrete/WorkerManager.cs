using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.ApplicationLayer.Mapper;
using Advance.DAL.Abstract;
using Advance.DTOs.DTOs.WorkerDTO;
using Advance.Model.Entities;

namespace Advance.ApplicationLayer.Concrete
{
    public class WorkerManager : IWorkerManager
    {
        private readonly IWorkerDAL _dal;
        private readonly MyMapper _mapper;

        public WorkerManager(IWorkerDAL dal)
        {
            _dal = dal ?? throw new ArgumentNullException(nameof(dal));
            _mapper = new MyMapper();
        }


        public async Task<List<WorkerDTO>> GetWorkers()
        {
            try
            {
                var data = await _dal.GetWorkers();
                if (data == null || data.Count == 0)
                {
                    return null;
                }
                return _mapper.Map<List<WorkerDTO>, List<Worker>>(data);
            }
            catch (Exception e)
            {
                
                return null;
            }
        }

        public async Task<WorkerDTO> GetWorker(int id)
        {
            if (id <= 0)
            {
                throw new ArgumentException("Geçersiz Worker ID.");
            }

            try
            {
                var data = await _dal.GetWorker(id);
                if (data == null)
                {
                    throw new InvalidOperationException("Belirtilen Worker ID ile eşleşen çalışan bulunamadı.");
                }
                return _mapper.Map<WorkerDTO, Worker>(data);
            }
            catch (Exception e)
            {
                
                return null;
            }
        }

        public async Task<int> DeleteWorker(int id)
        {
            if (id <= 0)
            {
                throw new ArgumentException("Geçersiz Worker ID.");
            }

            try
            {
                var data = await _dal.DeleteWorker(id);
                if (data == 0)
                {
                    throw new InvalidOperationException("Belirtilen Worker ID ile eşleşen çalışan bulunamadı.");
                }

                return data;
            }
            catch (Exception e)
            {

                return 0;
            }
        }

        public async Task<int> InsertWorker(WorkerInsertDTO workerDto)
        {

            if (workerDto == null)
            {
                throw new ArgumentException("Geçersiz çalışan.");
            }

            try
            {
                var data = await _dal.InsertWorker(workerDto);
                if (data == 0)
                {
                    throw new InvalidOperationException("Eklemede hata oluştu");
                }

                return data;
            }
            catch (Exception e)
            {

                return 0;
            }
        }

        public async Task<int> UpdateWorker(WorkerUpdateDTO workerDto)
        {
            if (workerDto == null)
            {
                throw new ArgumentException("Geçersiz çalışan.");
            }

            try
            {
                var data = await _dal.UpdateWorker(workerDto);
                if (data == 0)
                {
                    throw new InvalidOperationException("Eklemede hata oluştu");
                }

                return data;
            }
            catch (Exception e)
            {

                return 0;
            }
        }

        
    }
}
