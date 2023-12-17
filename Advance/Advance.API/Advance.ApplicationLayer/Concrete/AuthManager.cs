using Advance.ApplicationLayer.Abstract;
using Advance.DAL.Abstract;
using Advance.DTOs.DTOs.WorkerDTOs;

using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Advance.ApplicationLayer.Mapper;
using Advance.ExceptionHandling.CustomException;
using Advance.Model.Entities;
using AutoMapper;

namespace Advance.ApplicationLayer.Concrete
{
    public class AuthManager:IAuthManager
    {
        private readonly IAuthDAL _dal;
        private readonly IConfiguration _conf;
        private readonly MyMapper _mapper;
        public AuthManager(IAuthDAL dal, IConfiguration conf, MyMapper mapper)
        {
            _dal = dal;
            _conf = conf;
            _mapper = mapper;
        }

        public async Task<WorkerLoginDTO> Login(WorkerLoginDTO worker)
        {
            try
            {
                if (worker == null)
                    throw new CustomException("Girilen bilgilere dikkat ediniz.");
                var kisiVarmi = await _dal.Login(worker.WorkerEmail, worker.password);
               
                var data = _mapper.Map<WorkerDTO, Worker>(kisiVarmi);
                if (data == null)
                    throw new CustomException("Hata oluştu");


                var description = new SecurityTokenDescriptor()
                {
                    Audience = "www.oguz.com",
                    Issuer = "www.oguz.com",
                    Expires = DateTime.Now.AddMinutes(20),
                    Subject = new ClaimsIdentity(new Claim[] {
                        new Claim(ClaimTypes.NameIdentifier,data.WorkerID.ToString()),
                        new Claim(ClaimTypes.Email, kisiVarmi.WorkerEmail),
                        new Claim(ClaimTypes.Name,kisiVarmi.WorkerName),
                        new Claim(ClaimTypes.Role, kisiVarmi.Title.TitleName ),
                        new Claim(ClaimTypes.UserData,kisiVarmi.UpperWorkerID.ToString())
                    }),
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_conf["apisecretKey"])), SecurityAlgorithms.HmacSha512Signature),
                };

               
               
                
                var tokenHandler = new JwtSecurityTokenHandler();
                var token = tokenHandler.CreateToken(description);
                var kullaniciIcinUretilmisTokenDegeri = tokenHandler.WriteToken(token);
                var user=new WorkerLoginDTO()
                {
                    WorkerID = kisiVarmi.WorkerID,
                    WorkerName = kisiVarmi.WorkerName,
                    WorkerEmail = kisiVarmi.WorkerEmail,
                    password = worker.password,
                    TitleName = kisiVarmi.Title.TitleName,
                    Token = kullaniciIcinUretilmisTokenDegeri,
                    UpperWorkerID = kisiVarmi.UpperWorkerID
                };
                return user;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public async Task<WorkerRegisterDTO> Register(WorkerRegisterDTO user)
        {
            try
            {
                var kisiVarmi = await _dal.isUserExist(user.WorkerEmail);
                if (kisiVarmi != false)
                    throw new UserExceptions("Böyle bir maile sahip kullanıcı zaten mevcut.");

                var data = await _dal.Register(_mapper.Map<Worker, WorkerRegisterDTO>(user), user.password);

                return user;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            
        }
    }
}
