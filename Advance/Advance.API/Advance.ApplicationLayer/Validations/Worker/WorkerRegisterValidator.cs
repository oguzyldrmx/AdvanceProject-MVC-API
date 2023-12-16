using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Validations.GeneralExtensions;
using Advance.DTOs.DTOs.WorkerDTOs;
using FluentValidation;
namespace Advance.ApplicationLayer.Validations.Worker
{
    public class WorkerRegisterValidator : AbstractValidator<WorkerRegisterDTO>
    {
        public WorkerRegisterValidator()
        {
            RuleFor(x => x.WorkerName).NotNull().WithMessage("Lütfen çalışan ismi kısmını boş bırakmayınız.")
                .NotEmpty().WithMessage("Lütfen isim kısmını boş bırakmayınız.")
                .Must(OnlyLetterControlIncludeSpace).WithMessage("Lütfen isim alanında özel karakter veya sayı girmeyiniz.")
                .Length(3, 30).WithMessage("Lütfen isim alanına 3 ile 30 arasında karakter giriniz.");
            RuleFor(x => x.WorkerPhonenumber).Must(NumericControl).WithMessage("Lütfen çalışan telefona harf girmeyiniz")
                .NotNull().WithMessage("Lütfen telefon alanını boş geçmeyiniz")
                .NotEmpty().WithMessage("Lütfen telefon alanını boş geçmeyiniz");
            RuleFor(x => x.WorkerEmail).NotNull().WithMessage("Lütfen mail alanını boş geçmeyiniz")
                .NotEmpty().WithMessage("Lütfen mail alanını boş geçmeyiniz")
                .Must(IsEmail).WithMessage("Lütfen mail formatına uygun giriş yapınız");
            RuleFor(x => x.password).NotNull().WithMessage("Şifre alanını boş geçmeyiniz.")
                .NotEmpty().WithMessage("Lütfen şifreyi boş bırakmayınız")
                .MinimumLength(5).WithMessage("Şifre minimum 5 karakter olabilir");
        }
        private bool OnlyLetterControlIncludeSpace(string name)
        {
            return MyExtensions.OnlyLetterControlIncludeSpace(name);
        }

        private bool NumericControl(string data)
        {
            return MyExtensions.NumericControl(data);
        }

        private bool IsEmail(string data)
        {
            return MyExtensions.IsEmail(data);
        }
    }
}
