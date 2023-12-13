using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Advance.DTOs;
using Advance.DTOs.DTOs.WorkerDTO;
using Advance.Model.Entities;
using AutoMapper;

namespace Advance.ApplicationLayer.Mapper
{
    public class MyMapper : Profile
    {
        MapperConfiguration MapperConfiguration;
        public MyMapper()
        {

            CreateMap<WorkerDTO, Worker>().ReverseMap()
                 .ForMember(dest => dest.UnitDTO, opt => opt.MapFrom(src => src.Unit))
                 .ForMember(dest => dest.TitleDTO, opt => opt.MapFrom(src => src.Title));
            CreateMap<WorkerInsertDTO, Worker>().ReverseMap();
            CreateMap<WorkerUpdateDTO, Worker>().ReverseMap();
            //CreateMap<UnitWorkerDto, Unit>().ReverseMap();
            CreateMap<TitleDTO, Title>().ReverseMap();
            CreateMap<UnitDTO, Unit>().ReverseMap();
            MapperConfiguration = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(this);
            });
        }
        public TCikis Map<TCikis, TGiris>(TGiris giris)
            where TGiris : class, new()
            where TCikis : class, new()
        {
            IMapper mapper = MapperConfiguration.CreateMapper();

            try
            {
                return mapper.Map<TCikis>(giris);
            }
            catch (Exception)
            {
                return null;
            }

        }
    }
}
