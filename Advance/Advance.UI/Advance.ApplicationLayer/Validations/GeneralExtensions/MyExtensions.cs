using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Advance.ApplicationLayer.Validations.GeneralExtensions
{
    public static class MyExtensions
    {
       
        public static bool ControlNullOrWhiteSpaceAndLength(this string value, int length)
        {
            return (!string.IsNullOrWhiteSpace(value) && value.Length < length);
        }


        
        public static bool NumberCheckV2(string value)

        {
            return Regex.IsMatch(value, "^[0-9]*$");

        }

        public static bool SpaceControl(this string metin)
        {
            return string.IsNullOrEmpty(metin);
        }

        public static bool NumericControl(this string metin)
        {
            return metin.Any(char.IsDigit);
        }

        public static bool LiteralControl(this string metin)
        {
            return metin.Any(char.IsLetter);
        }

        public static bool SpaceOrNull(this string s)
        {
            return (!string.IsNullOrWhiteSpace(s));
        }

        public static bool TextControl(params string[] inputs)
        {
            foreach (var item in inputs)
            {
                if (!SpaceOrNull(item))
                {
                    return false;
                }
            }
            return true;
        }

        
        public static bool SqlControl(params string[] inputs)
        {
            //örnek sqli inputu = Deneme'; drop table DenemeTablosu-- 
            foreach (var input in inputs)
            {
                if (input.Contains(";") || input.Contains("'") || input.Contains("--") || input.Contains("/*") || input.Contains("*/") || input.Contains("xp_"))
                {
                    return false;
                }
            }
            return true;
        }

        
        public static bool TarihDogruMu(this string input)
        {
            DateTime date;
            return DateTime.TryParse(input, out date);
        }

        public static bool IsNullOrEmpty(this string value)
        => string.IsNullOrEmpty(value?.Trim());
        public static bool IsNullOrEmpty<T>(this IList<T> list)
        {
            if (list is null || list.Count == 0) return true;
            return false;
        }

        public static bool IsPastDate(this DateTime date)
        {
            return date.Date < DateTime.Now.Date;
        }
        public static bool IsNullOrEmpty(params string[] values)
        {
            foreach (string value in values)
            {
                if (string.IsNullOrWhiteSpace(value))
                {
                    return true;
                }
            }
            return false;
        }
        public static bool SifreTekrariKontrol(string password, string passwordAgain)
        {
            return password != passwordAgain;
        }

        public static bool MailMi(string mail)
        {
            bool varMi = false;
            foreach (var item in mail)
            {
                if (item == '@')
                {
                    varMi = true;
                }
            }
            return varMi;
        }
        public static bool SayiVarmi(params string[] values)
        {
            bool varMi = false;
            foreach (string metin in values)
            {
                if (Regex.IsMatch(metin, @"\d"))
                {
                    varMi = true;
                }
            }
            return varMi;
        }

        public static bool OzelKarakterVarMi(params string[] values)
        {
            bool varMi = false;
            foreach (string metin in values)
            {
                if (Regex.IsMatch(metin, @"[!@#$%^&*()_+{}[]:;'""|<>,./\]"))
                {
                    varMi = true;
                }
            }
            return varMi;
        }

        public static bool BeAllLetters(string str)
        {
            // Bu metod, string'in sadece harf içerip içermediğini kontrol eder.
            return str.All(char.IsLetter);
        }

        public static bool OnlyLetterControl(this string metin)
        {
            return Regex.IsMatch(metin, @"^[a-zA-ZğüşıöçĞÜŞİÖÇ]+$");
        }

        public static bool BeNumeric(int number)
        {
            return int.TryParse(number.ToString(), out _);
        }
        public static bool IsEmail(string email)
        {
            if (string.IsNullOrEmpty(email))
                return false;
            var emailRegex = new Regex(@"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$");
            return emailRegex.IsMatch(email);
        }
    }
}
