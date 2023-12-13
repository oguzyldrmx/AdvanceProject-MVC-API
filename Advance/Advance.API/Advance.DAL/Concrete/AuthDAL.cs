using Advance.DAL.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Advance.DAL.Context;
using Advance.Model.Entities;
using Dapper;
using Advance.DTOs.DTOs.WorkerDTO;

namespace Advance.DAL.Concrete
{
    public class AuthDAL : IAuthDAL
    {
        private readonly ConnectionHelper _con;

        public AuthDAL(ConnectionHelper con)
        {
            _con = con;
        }

        public async Task<Worker> Login(string mail, string password)
        {
            var query = "select * from Worker where WorkerEmail = @WorkerEmail";

            using var connection = _con.CreateConnection();
            Worker user = await connection.QueryFirstOrDefaultAsync<Worker>(query, new
            {
                WorkerEmail = mail,
            });
            if (user == null)
            {
                return null;
            }

            return !SifreKontrolEt(password, user.PasswordSalt, user.PasswordHash) ? null : user;
        }

        public async Task<bool> isUserExist(string mail)
        {
            var query = "select WorkerName,WorkerEmail,PasswordSalt,PasswordHash from Worker where WorkerEmail = @WorkerEmail";
            var connection = _con.CreateConnection();
            Worker user = await connection.QueryFirstOrDefaultAsync(query, new
            {
                WorkerEmail = mail,
            });
            if (user == null)
            {
                return false;
            }

            return true;
        }

        private bool SifreKontrolEt(string password, byte[] userPassSalt, byte[] userPasswordHash)
        {
            using (var hmac = new HMACSHA512(userPassSalt))
            {
                var passwordHashed = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
                for (int i = 0; i < passwordHashed.Length; i++)
                {
                    if (userPasswordHash[i] != passwordHashed[i])
                    {
                        return false;
                    }
                }
                return true;
            }
        }

        public async Task<Worker> Register(Worker user, string password)
        {
            byte[] passHash, passSalt;
            SifreOlustur(password, out passHash, out passSalt);

            user.PasswordHash = passHash;
            user.PasswordSalt = passSalt;
            var query = "insert into Worker(WorkerName,WorkerEmail,WorkerPhonenumber,UnitID,TitleID,UpperWorkerID,PasswordSalt,PasswordHash) values(@WorkerName,@WorkerEmail,@WorkerPhonenumber,@UnitID,@TitleID,@UpperWorkerID,@PasswordSalt,@PasswordHash)";
            using var connection = _con.CreateConnection();
             var affectedRows = await connection.ExecuteAsync(query, new
            {
                WorkerName = user.WorkerName,
                WorkerEmail = user.WorkerEmail,
                WorkerPhonenumber = user.WorkerPhonenumber,
                UnitID = user.UnitID,
                TitleID = user.TitleID,
                UpperWorkerID = user.UpperWorkerID,
                PasswordHash = passHash,
                PasswordSalt = passSalt

            });
             return user;
        }

        public void SifreOlustur(string password, out byte[] passHash, out byte[] passSalt)
        {
            using (var hmac = new HMACSHA512())
            {
                passHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
                passSalt = hmac.Key;
            }
        }
    }
}
