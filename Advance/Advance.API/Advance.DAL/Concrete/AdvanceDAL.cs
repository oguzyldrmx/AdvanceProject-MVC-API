﻿using System;
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

        public async Task<List<AdvanceDetailDTO>> GetDetails(int advanceID)
        {
            if (advanceID == 0) return null;

            using var conn = _con.CreateConnection();

            var data = await conn.QueryAsync<AdvanceDetailDTO>("SP_GetDetails", new { advanceId = advanceID }, commandType: CommandType.StoredProcedure);
            return data.ToList();
        }

        public async Task<int> AdvanceInsert(AdvanceInsertDTO dto)
        {
            if (dto == null) return 0;
            
            var conn = _con.CreateConnection();
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            int etkilenenSatirSayisi = 0;

            using (var transaction = conn.BeginTransaction())
            {
                try
                {
                    var queryWorker = "select * from Worker where WorkerID = @id";
                    var workerWhoWantsAdvance = conn.QueryFirstAsync<Worker>(queryWorker, new
                    {
                        id = dto.WorkerID
                    },transaction);

                    var queryAdvance = "insert into Advance(AdvanceAmount,AdvanceExplanation, TitleAmountApprovalRuleID,   WorkerID, RequestDate,DesiredDate, ProjectID) values(@AdvanceAmount,@AdvanceExplanation,@TitleAmountApprovalRuleID,@WorkerID,@RequestDate, @DesiredDate, @ProjectID); SELECT SCOPE_IDENTITY(); ";

                    var advance = conn.ExecuteScalar<int>(queryAdvance, new
                    {
                        AdvanceAmount = dto.AdvanceAmount,
                        AdvanceExplanation = dto.AdvanceExplanation,
                        TitleAmountApprovalRuleID = GetRule(dto.AdvanceAmount),
                        WorkerID = dto.WorkerID,
                        RequestDate=DateTime.UtcNow,
                        DesiredDate = dto.DesiredDate,
                        ProjectID = dto.ProjectID
                    },transaction);

                    var queryApproval =
                        "insert into AdvanceApproveStatus(AdvanceID,ApproverOrRejecterID,[Approved/DeclinedDate],ApprovalStatusID,ApprovedAmount,NextApproverOrRejecterID)  values(@AdvanceID,  @ApproverOrRejecterID,@ApprovedDeclinedDate,@ApprovalStatusID,@ApprovedAmount,@NextApproverOrRejecterID)";
                    var parameters = new DynamicParameters();
                    parameters.Add("AdvanceID", advance, DbType.Int32);
                    parameters.Add("ApprovalStatusID", 1, DbType.Int32);
                    parameters.Add("ApproverOrRejecterID", null, DbType.Int32);
                    parameters.Add("ApprovedDeclinedDate", DateTime.Now, DbType.DateTime);
                    parameters.Add("ApprovedAmount", null, DbType.Decimal);
                    parameters.Add("NextApproverOrRejecterID", workerWhoWantsAdvance.Result.UpperWorkerID, DbType.Int32);
                    etkilenenSatirSayisi = conn.Execute(queryApproval, parameters, transaction);
                    transaction.Commit();
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    etkilenenSatirSayisi = 0;

                }
                finally
                {
                    if (conn.State == ConnectionState.Open)
                    {
                        conn.Close();
                    }
                }

                return etkilenenSatirSayisi;
            }
           

        }

        public async Task<List<AdvanceWhoIsApprovingDTO>> GetWhoIsApproving(int workerID)
        {
            if (workerID == 0) return null;

            using var conn = _con.CreateConnection();

            var data = await conn.QueryAsync<AdvanceWhoIsApprovingDTO>("SP_CheckApproveOrder", new { id = workerID }, commandType: CommandType.StoredProcedure);
            return data.ToList();
        }

        public async Task<int> AdvanceInsertDetail(AdvanceDetailsInsertDTO dto)
        {
            int etkilenenSatirSayisi = 0;
            var queryApproval =
                "insert into AdvanceApproveStatus(AdvanceID,ApproverOrRejecterID,[Approved/DeclinedDate],ApprovalStatusID,ApprovedAmount,NextApproverOrRejecterID)  values(@AdvanceID,  @ApproverOrRejecterID,@ApprovedDeclinedDate,@ApprovalStatusID,@ApprovedAmount,@NextApproverOrRejecterID)";
            using var conn = _con.CreateConnection();
            var parameters = new DynamicParameters();
            parameters.Add("AdvanceID", dto.AdvanceID, DbType.Int32);
            parameters.Add("ApprovalStatusID", dto.ApprovalStatusID+1, DbType.Int32);
            parameters.Add("ApproverOrRejecterID", dto.ApproverOrRejecterID, DbType.Int32);
            parameters.Add("ApprovedDeclinedDate", DateTime.Now, DbType.DateTime);
            parameters.Add("ApprovedAmount", dto.ApprovedAmount, DbType.Decimal);
            parameters.Add("NextApproverOrRejecterID", dto.NextApproverOrRejecterID, DbType.Int32);
            etkilenenSatirSayisi = conn.Execute(queryApproval, parameters);
            return etkilenenSatirSayisi;
        }

        public int GetRule(decimal amount)
        {
            var query = "select max(tar.ID) from TitleAmountApprovalRule tar left join Amount a on a.AmountID = tar.AmountID where a.MinAmount <= @AmountMin";
            using var conn = _con.CreateConnection();
            return conn.ExecuteScalar<int>(query, new { AmountMax = amount, AmountMin = amount });
        }
    }
}
