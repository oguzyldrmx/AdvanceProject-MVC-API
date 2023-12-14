using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.DTOs.TitleUnitUpperWorkerDTOs;
using Advance.Services.ApiConnectServices;

namespace Advance.ApplicationLayer.Concrete
{
    public class TitleUnitUpperWorkerManager:ITitleUnitUpperWorkerManager
    {
        private readonly TitleUnitUpperWorkerServices _services;

        public TitleUnitUpperWorkerManager(TitleUnitUpperWorkerServices services)
        {
            _services = services;
        }

        public async Task<TitleUnitUpperWorkerDTO> GetTitleUnitUpperWorkers()
        {
            try
            {
                var data = await _services.GetTitleUnitUpperWorkers();
                if (data == null)
                {
                    throw new NullReferenceException();
                }

                return data;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
