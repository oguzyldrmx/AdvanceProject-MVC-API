using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Advance.DTOs.DTOs.WorkerDTOs;
using Newtonsoft.Json;

namespace Advance.Services.ApiConnectServices
{
    public class WorkerConnectService
    {
        private readonly HttpClient _client;

        public WorkerConnectService(HttpClient client)
        {
            _client = client;
        }

        public async Task<WorkerLoginDTO> Login(WorkerLoginDTO worker)
        {
            StringContent content = new StringContent(JsonConvert.SerializeObject(worker));
            content.Headers.ContentType = new MediaTypeHeaderValue("application/json");

            var deger = await _client.PostAsync("login", content);
            if (deger.IsSuccessStatusCode)
            {
                return JsonConvert.DeserializeObject<WorkerLoginDTO>(await deger.Content.ReadAsStringAsync());
            }

            return null;
        }
        public async Task<WorkerRegisterDTO> Register(WorkerRegisterDTO worker)
        {
            StringContent content = new StringContent(JsonConvert.SerializeObject(worker));
            content.Headers.ContentType = new MediaTypeHeaderValue("application/json");

            var deger = await _client.PostAsync("register", content);
            if (deger.IsSuccessStatusCode)
            {
                return JsonConvert.DeserializeObject<WorkerRegisterDTO>(await deger.Content.ReadAsStringAsync());
            }

            return null;
        }
    }
}
