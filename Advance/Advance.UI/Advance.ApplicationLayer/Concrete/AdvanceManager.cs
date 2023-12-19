using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.DTOs.DTOs.AdvanceDTOs;
using Advance.DTOs.DTOs.ProjectDTOs;
using Advance.DTOs.DTOs.TitleUnitUpperWorkerDTOs;
using Advance.ExceptionHandling.CustomException;
using Advance.Services.ApiConnectServices;

namespace Advance.ApplicationLayer.Concrete
{
    public class AdvanceManager:IAdvanceManager
    {
        private readonly AdvanceConnectService _services;

        public AdvanceManager(AdvanceConnectService services)
        {
            _services = services;
        }

        public async Task<List<AdvanceListDTO>> GetAdvances(int id, string token)
        {
            try
            {
                if (id == 0) throw new CustomException("Kullanıcının İD si alınamadı");

                var data = await _services.GetAdvances(id, token);
                if (data == null)
                {
                    throw new CustomException("Gecmis avanslar cekilirken hata oluştu");
                }

                return data;
            }
            catch (Exception ex)
            {
                
                return null;
            }
        }

        public async Task<List<AdvanceDetailDTO>> GetDetails(int id, string token)
        {
            try
            {
                if (id == 0) throw new CustomException("Avans İD si alınamadı");

                var data = await _services.GetDetails(id, token);
                if (data == null)
                {
                    throw new CustomException("Detaylar cekilirken hata oluştu");
                }

                return data;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<string> AdvanceInsert(AdvanceInsertDTO dto,string token)
        {
            try
            {
                if (dto==null)
                {
                    throw new ArgumentNullException(nameof(dto));
                }

                var data = await _services.AdvanceInsert(dto,token);
                if (data == null) return "Başarısız";
                return "Başarılı";
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<string> AdvanceOMInsert(AdvanceOMDetailsInsertDTO dto, string token)
        {
            try
            {
                if (dto == null)
                {
                    throw new ArgumentNullException(nameof(dto));
                }

                var data = await _services.AdvanceOMInsert(dto, token);
                if (data == null) return "Başarısız";
                return "Başarılı";
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<string> AdvanceDetailsInsert(AdvanceDetailsInsertDTO dto, string token)
        {
            try
            {
                if (dto == null)
                {
                    throw new ArgumentNullException(nameof(dto));
                }

                var data = await _services.AdvanceDetailsInsert(dto, token);
                if (data == null) return "Başarısız";
                return "Başarılı";
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<List<ProjectDTO>> GetProjectsForWorker(int id, string token)
        {
            try
            {
                if (id == 0) throw new CustomException("Worker İD si alınamadı");

                var data = await _services.GetProjectsForWorker(id, token);
                if (data == null)
                {
                    throw new CustomException("Projeler cekilirken hata oluştu");
                }

                return data;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<List<AdvanceWhoIsApprovingDTO>> GetWhoIsApproving(int id)
        {
            try
            {
                if (id == 0) throw new CustomException("Avans İD si alınamadı");

                var data = await _services.GetWhoIsApproving(id);
                if (data == null)
                {
                    throw new CustomException("Detaylar cekilirken hata oluştu");
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

