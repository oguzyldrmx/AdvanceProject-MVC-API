using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.DAL.Abstract;
using Advance.DTOs.TitleUnitUpperWorkerDTOs;

namespace Advance.ApplicationLayer.Concrete
{
    public class TitleUnitUpperWorkerManager: ITitleUnitUpperWorkerManager
    {
        private readonly ITitleUnitUpperWorkerDAL _dal;

        public TitleUnitUpperWorkerManager(ITitleUnitUpperWorkerDAL dal)
        {
            _dal = dal;
        }

        public async Task<TitleUnitUpperWorkerDTO> GetTitleUnitUpperWorkers()
        {
            try
            {
                var data = await _dal.GetTitleUnitUpperWorkers();
                return data;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
