using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.ExceptionHandling.CustomException
{
    public class UserExceptions : Exception
    {

        public UserExceptions() : base("Giriş işlemi başarısız...")
        {
        }

        public UserExceptions(string message) : base(message)
        {
        }

        public UserExceptions(string message, Exception innerException) : base(message, innerException)
        {
        }

    }
}
