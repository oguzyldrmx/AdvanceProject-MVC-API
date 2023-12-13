using Advance.Model.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.DAL.Abstract
{
    public interface IAuthDAL
    {
        Task<Worker> Register(Worker user, string password);

        Task<Worker> Login(string mail, string password);

        Task<bool> isUserExist(string mail);
    }
}
