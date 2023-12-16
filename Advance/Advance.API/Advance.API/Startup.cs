using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.ApplicationLayer.Concrete;
using Advance.ApplicationLayer.Mapper;
using Advance.DAL.Abstract;
using Advance.DAL.Concrete;
using Advance.DAL.Context;
using System.Text;
using Advance.ApplicationLayer.Validations.Worker;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;

namespace Advance.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddSingleton<ConnectionHelper>();
            services.AddScoped<IWorkerManager, WorkerManager>();
            services.AddScoped<IWorkerDAL, WorkerDAL>();
            services.AddScoped<IAuthDAL, AuthDAL>();
            services.AddScoped<IAuthManager, AuthManager>();
            services.AddScoped<ITitleUnitUpperWorkerDAL, TitleUnitUpperWorkerDAL>();
            services.AddScoped<ITitleUnitUpperWorkerManager, TitleUnitUpperWorkerManager>();
            services.AddScoped<IAdvanceDAL, AdvanceDAL>();
            services.AddScoped<IProjectDAL, ProjectDAL>();
            services.AddScoped<IAdvanceManager, AdvanceManager>();
            services.AddScoped<IProjectManager, ProjectManager>();

            services.AddScoped<MyMapper>();

            services.AddControllers().AddFluentValidation(fv =>
            {
                fv.RegisterValidatorsFromAssemblyContaining<WorkerRegisterValidator>();
                fv.RegisterValidatorsFromAssemblyContaining<WorkerLoginValidator>();
            });
            
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Advance.API", Version = "v1" });
            });

            services.AddCors(opt =>
            {
                opt.AddDefaultPolicy(a => a.WithOrigins().AllowAnyHeader().AllowAnyMethod());
            });
            
            var bilgi = Encoding.UTF8.GetBytes(Configuration["apisecretKey"]);

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(opt =>
            {
                opt.TokenValidationParameters = new TokenValidationParameters()
                {
                    IssuerSigningKey = new SymmetricSecurityKey(bilgi),
                    ValidateIssuer = true,
                    ValidateIssuerSigningKey = true,
                    ValidateAudience = true,
                    ValidAudience = "www.oguz.com",
                    ValidIssuer = "www.oguz.com"

                };
            });
            
            services.AddAuthorization();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseCors();
            app.UseCors(builder => builder.WithOrigins("http://localhost:48868").AllowAnyHeader().AllowAnyMethod());
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Advance.API v1"));
            }

            app.UseRouting();
            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
