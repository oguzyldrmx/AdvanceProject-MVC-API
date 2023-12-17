using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.ApplicationLayer.Mapper;
using Advance.DAL.Abstract;
using Advance.DTOs.DTOs.AdvanceDTOs;
using Advance.DTOs.DTOs.WorkerDTOs;
using Advance.Model.Entities;

namespace Advance.ApplicationLayer.Concrete
{
    public class AdvanceManager:IAdvanceManager
    {
        private readonly IAdvanceDAL _dal;
        private readonly MyMapper _mapper;

        public AdvanceManager(IAdvanceDAL dal, MyMapper mapper)
        {
            _dal = dal ?? throw new ArgumentNullException(nameof(dal));
            _mapper = mapper;
        }

        public async Task<List<AdvanceListDTO>> GetAdvances(int id)
        {
            try
            {
                var data = await _dal.GetAdvances( id);
                if (data == null || data.Count == 0)
                {
                    throw new Exception("Avanslar getirilirken bir hata oluştu");
                }

                return data;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public async Task<List<AdvanceDetailDTO>> GetDetails(int id)
        {
            try
            {
                var data = await _dal.GetDetails(id);
                if (data == null || data.Count == 0)
                {
                    throw new Exception("Detaylar getirilirken bir hata oluştu");
                }

                return data;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public async Task<string> InsertAdvance(AdvanceInsertDTO dto)
        {
            try
            {
                if (dto == null) throw new ArgumentNullException(nameof(dto));

                var data = await _dal.AdvanceInsert(dto);

                if (data > 0)
                {
                    return "Avans Oluşturuldu";
                }

                return "Avans oluştururken bir hatayla karşılaşıldı.";
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public async Task<List<AdvanceWhoIsApprovingDTO>> GetWhoIsApproving(int id)
        {
            try
            {
                var data = await _dal.GetWhoIsApproving(id);
                if (data == null || data.Count == 0)
                {
                    throw new Exception("Data getirilirken bir hata oluştu");
                }

                return data;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public async Task<string> InsertAdvanceDetails(AdvanceDetailsInsertDTO dto)
        {
            try
            {
                if (dto == null) throw new ArgumentNullException(nameof(dto));

                var data = await _dal.AdvanceInsertDetail(dto);

                if (data > 0)
                {
                    return "Avans detayı Oluşturuldu";
                }

                return "Avans detayı oluştururken bir hatayla karşılaşıldı.";
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
