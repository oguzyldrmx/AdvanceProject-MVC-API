using Advance.DTOs.DTOs.TitleUnitUpperWorkerDTOs;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.AdvanceDTOs;
using Advance.DTOs.DTOs.ProjectDTOs;
using Newtonsoft.Json.Linq;

namespace Advance.Services.ApiConnectServices
{
    public class AdvanceConnectService
    {
        private readonly HttpClient _httpClient;

        public AdvanceConnectService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<List<AdvanceListDTO>> GetAdvances(int id, string token)
        {
            _httpClient.DefaultRequestHeaders.Add($"Authorization", $"Bearer {token}");

            var donenDeger = await _httpClient.GetAsync($"getadvances/{id}");
            if (donenDeger.IsSuccessStatusCode)
            {
                var data = JsonConvert.DeserializeObject<List<AdvanceListDTO>>(await donenDeger.Content.ReadAsStringAsync());
                return data;
            }
            return null;
        }

        public async Task<List<AdvanceDetailDTO>> GetDetails(int id, string token)
        {
            _httpClient.DefaultRequestHeaders.Add($"Authorization", $"Bearer {token}");

            var donenDeger = await _httpClient.GetAsync($"getdetails/{id}");
            if (donenDeger.IsSuccessStatusCode)
            {
                var data = JsonConvert.DeserializeObject<List<AdvanceDetailDTO>>(await donenDeger.Content.ReadAsStringAsync());
                return data;
            }
            return null;
        }
        public async Task<List<AdvanceWhoIsApprovingDTO>> GetWhoIsApproving(int id)
        {

            var donenDeger = await _httpClient.GetAsync($"getwhoisapproving/{id}");
            if (donenDeger.IsSuccessStatusCode)
            {
                var data = JsonConvert.DeserializeObject<List<AdvanceWhoIsApprovingDTO>>(await donenDeger.Content.ReadAsStringAsync());
                return data;
            }
            return null;
        }
        public async Task<AdvanceOMDetailsInsertDTO> AdvanceOMInsert(AdvanceOMDetailsInsertDTO dto,string token)
        {
            StringContent content = new StringContent(JsonConvert.SerializeObject(dto));
            content.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            _httpClient.DefaultRequestHeaders.Add($"Authorization", $"Bearer {token}");
            var donenDeger = await _httpClient.PostAsync("advanceominsert", content);
            var data = await donenDeger.Content.ReadAsStringAsync();
            if (donenDeger.IsSuccessStatusCode)
            {
                return JsonConvert.DeserializeObject<AdvanceOMDetailsInsertDTO>(
                    await donenDeger.Content.ReadAsStringAsync());
            }
            return null;
        }
        public async Task<AdvanceInsertDTO> AdvanceInsert(AdvanceInsertDTO dto,string token)
        {
            StringContent content = new StringContent(JsonConvert.SerializeObject(dto));
            content.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            _httpClient.DefaultRequestHeaders.Add($"Authorization", $"Bearer {token}");
            var donenDeger = await _httpClient.PostAsync("advanceinsert", content);
            var data = await donenDeger.Content.ReadAsStringAsync();
            if (donenDeger.IsSuccessStatusCode)
            {
                return JsonConvert.DeserializeObject<AdvanceInsertDTO>(
                    await donenDeger.Content.ReadAsStringAsync());
            }

            return null;
        }
        public async Task<AdvanceDetailsInsertDTO> AdvanceDetailsInsert(AdvanceDetailsInsertDTO dto, string token)
        {
            _httpClient.DefaultRequestHeaders.Add($"Authorization", $"Bearer {token}");

            StringContent content = new StringContent(JsonConvert.SerializeObject(dto));
            content.Headers.ContentType = new MediaTypeHeaderValue("application/json");

            var donenDeger = await _httpClient.PostAsync("advancedetailinsert", content);
            var data = await donenDeger.Content.ReadAsStringAsync();
            if (donenDeger.IsSuccessStatusCode)
            {
                return JsonConvert.DeserializeObject<AdvanceDetailsInsertDTO>(
                    await donenDeger.Content.ReadAsStringAsync());
            }

            return null;
        }
        public async Task<List<ProjectDTO>> GetProjectsForWorker(int id, string token)
        {
            _httpClient.DefaultRequestHeaders.Add($"Authorization", $"Bearer {token}");

            var donenDeger = await _httpClient.GetAsync($"getprojects/{id}");
            if (donenDeger.IsSuccessStatusCode)
            {
                return JsonConvert.DeserializeObject<List<ProjectDTO>>(await donenDeger.Content.ReadAsStringAsync());
            }
            return null;
        }
    }
}
