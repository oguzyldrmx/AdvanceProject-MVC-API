using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Advance.DAL.Abstract;
using Advance.DAL.Context;
using Advance.DTOs.DTOs.WorkerDTO;
using Advance.Model.Entities;
using Dapper;

namespace Advance.DAL.Concrete
{
    public class WorkerDAL : IWorkerDAL
    {
        private readonly ConnectionHelper _con;

        public WorkerDAL(ConnectionHelper con)
        {
            _con = con;
        }

        public async Task<List<Worker>> GetWorkers()
        {
            var query = "select w.WorkerID,w.WorkerName,w.WorkerEmail,w.WorkerPhonenumber,w.UpperWorkerID,w.PasswordSalt,w.PasswordHash,u.UnitID,u.UnitName,t.TitleID,t.TitleName from Worker w join Unit u on u.UnitID = w.UnitID join Title t on t.TitleID = w.TitleID";
            using var connection = _con.CreateConnection();
            var data = await connection.QueryAsync<Worker, Unit, Title, Worker>(query,
                (worker, unit, title) =>
                {
                    worker.Unit = unit;
                    worker.Title = title;
                    return worker;
                },
                splitOn: "UnitID, TitleID");
            return data.ToList();
        }

        public async Task<Worker> GetWorker(int id)
        {
            var query = "select w.WorkerID,w.WorkerName,w.WorkerEmail,w.WorkerPhonenumber,w.UpperWorkerID,w.PasswordSalt,w.PasswordHash,u.UnitID,u.UnitName,t.TitleID,t.TitleName from Worker w join Unit u on u.UnitID = w.UnitID join Title t on t.TitleID = w.TitleID where w.WorkerID = @WorkerID";
            var workerparameters = new DynamicParameters();
            workerparameters.Add("WorkerID", id, DbType.Int32);

            using var connection = _con.CreateConnection();
            var data = await connection.QueryAsync<Worker, Unit, Title, Worker>(query,
                (worker, unit, title) =>
                {
                    worker.Unit = unit;
                    worker.Title = title;
                    return worker;
                },
                splitOn: "UnitID, TitleID",
                param: workerparameters);
            return data.FirstOrDefault();
        }

        public async Task<int> DeleteWorker(int id)
        {
            var query = "DELETE FROM Worker WHERE WorkerID = @WorkerID";
           

            using var connection = _con.CreateConnection();
            var affectedRows = await connection.ExecuteAsync(query, new
            {
                WorkerID = id
            });

            return affectedRows;
        }

        public async Task<int> InsertWorker(WorkerInsertDTO workerDto)
        {
            var query = "insert into Worker(WorkerName,WorkerEmail,WorkerPhonenumber,UnitID,TitleID,UpperWorkerID) values(@WorkerName,@WorkerEmail,@WorkerPhonenumber,@UnitID,@TitleID,@UpperWorkerID)";
          

            using var connection = _con.CreateConnection();
            var affectedRows = await connection.ExecuteAsync(query, new
            {
                WorkerName = workerDto.WorkerName,
                WorkerEmail = workerDto.WorkerEmail,
                WorkerPhonenumber = workerDto.WorkerPhonenumber,
                UnitID = workerDto.UnitID,
                TitleID = workerDto.TitleID,
                UpperWorkerID = workerDto.UpperWorkerID 

            });

            return affectedRows;
        }

        public async Task<int> UpdateWorker(WorkerUpdateDTO workerDto)
        {
            var query = "UPDATE Worker SET WorkerName = @WorkerName,    WorkerEmail = @WorkerEmail, WorkerPhonenumber = @WorkerPhonenumber, UnitID = @UnitID,TitleID = @TitleID,UpperWorkerID = @UpperWorkerID WHERE WorkerID = @id;";


            using var connection = _con.CreateConnection();
            var affectedRows = await connection.ExecuteAsync(query, new
            {
                id = workerDto.WorkerID,
                WorkerName = workerDto.WorkerName,
                WorkerEmail = workerDto.WorkerEmail,
                WorkerPhonenumber = workerDto.WorkerPhonenumber,
                UnitID = workerDto.UnitID,
                TitleID = workerDto.TitleID,
                UpperWorkerID = workerDto.UpperWorkerID

            });

            return affectedRows;
        }
    }
}
