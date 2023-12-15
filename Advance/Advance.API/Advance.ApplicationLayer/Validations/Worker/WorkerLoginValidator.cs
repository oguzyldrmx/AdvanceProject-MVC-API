using Advance.ApplicationLayer.Validations.GeneralExtensions;
using Advance.DTOs.DTOs.WorkerDTOs;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Advance.ApplicationLayer.Validations.Worker
{
    public class WorkerLoginValidator : AbstractValidator<WorkerLoginDTO>
    {
        public WorkerLoginValidator()
        {
  
            RuleFor(x => x.WorkerEmail).NotNull().WithMessage("Lütfen mail alanını boş geçmeyiniz")
                .NotEmpty().WithMessage("Lütfen mail alanını boş geçmeyiniz")
                .Must(IsEmail).WithMessage("Lütfen mail formatına uygun giriş yapınız");
            RuleFor(x => x.password).NotNull().WithMessage("Şifre alanını boş geçmeyiniz.")
                .NotEmpty().WithMessage("Lütfen şifreyi boş bırakmayınız");
        }
       

      

        private bool IsEmail(string data)
        {
            return MyExtensions.IsEmail(data);
        }
    }
}
