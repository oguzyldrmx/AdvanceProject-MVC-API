using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.TitleDTOs;
using Advance.DTOs.TitleUnitUpperWorkerDTOs;
using Advance.DTOs.UnitDTOs;

namespace Advance.Services.ApiConnectServices
{
    public class TitleUnitUpperWorkerServices
    {
        private readonly HttpClient _httpClient;

        public TitleUnitUpperWorkerServices(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<TitleUnitUpperWorkerDTO> GetTitleUnitUpperWorkers()
        {
            var donenDeger = await _httpClient.GetAsync("gettitleunitupperworkers");
            if (donenDeger.IsSuccessStatusCode)
            {
                var data = JsonConvert.DeserializeObject<TitleUnitUpperWorkerDTO>(await donenDeger.Content.ReadAsStringAsync());
                return data;
            }
            return null;
        }

       
    }
}
