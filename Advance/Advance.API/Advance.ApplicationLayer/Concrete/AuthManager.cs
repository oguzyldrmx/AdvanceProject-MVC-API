﻿using Advance.ApplicationLayer.Abstract;
using Advance.DAL.Abstract;
using Advance.DTOs.DTOs.WorkerDTO;

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

namespace Advance.ApplicationLayer.Concrete
{
    public class AuthManager:IAuthManager
    {
        private readonly IAuthDAL _dal;
        private readonly IConfiguration _conf;
        private readonly MyMapper _mapper;
        public AuthManager(IAuthDAL dal, IConfiguration conf)
        {
            _dal = dal;
            _conf = conf;
            _mapper = new MyMapper();
        }

        public async Task<string> Login(WorkerLoginDTO worker)
        {
            try
            {
                var kisiVarmi = await _dal.Login(worker.WorkerEmail, worker.password);
                var data = _mapper.Map<WorkerDTO, Worker>(kisiVarmi);
                if (data == null)
                    return null; //todo register et geriye dön
                var description = new SecurityTokenDescriptor()
                {
                    Expires = DateTime.Now.AddMinutes(20),
                    Subject = new ClaimsIdentity(new Claim[]
                    {
                        new Claim(ClaimTypes.Email, worker.WorkerEmail)
                    }),
                    SigningCredentials = new SigningCredentials(
                        new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_conf["apisecretKey"])),
                        SecurityAlgorithms.HmacSha512)
                };
                var tokenHandler = new JwtSecurityTokenHandler();
                var token = tokenHandler.CreateToken(description);
                var kullaniciIcinUretilmisTokenDegeri = tokenHandler.WriteToken(token);

                return kullaniciIcinUretilmisTokenDegeri;
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
                {
                    throw new UserExceptions("Böyle bir maile sahip kullanıcı zaten mevcut.");
                    
                }
                 ;
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