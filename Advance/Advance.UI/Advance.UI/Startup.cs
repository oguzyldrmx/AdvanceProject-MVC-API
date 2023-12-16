using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Advance.ApplicationLayer.Abstract;
using Advance.ApplicationLayer.Concrete;
using Advance.ApplicationLayer.Validations.Worker;
using Advance.Services.ApiConnectServices;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.Cookies;

namespace Advance.UI
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
            services.AddControllersWithViews().AddFluentValidation(fv =>
            {
                fv.RegisterValidatorsFromAssemblyContaining<WorkerRegisterValidator>();
                fv.RegisterValidatorsFromAssemblyContaining<WorkerLoginValidator>();
            });
            services.AddScoped<IWorkerManager, WorkerManager>();
            services.AddScoped<IAdvanceManager, AdvanceManager>();
            services.AddScoped<ITitleUnitUpperWorkerManager, TitleUnitUpperWorkerManager>();
            services.AddHttpClient<WorkerConnectService>(conf =>
            {
                conf.BaseAddress = new Uri((Configuration["myBase"]));

            }); 
            services.AddHttpClient<AdvanceConnectService>(conf =>
            {
                conf.BaseAddress = new Uri((Configuration["myBase"]));

            });
            services.AddHttpClient<TitleUnitUpperWorkerServices>(conf =>
            {
                conf.BaseAddress = new Uri((Configuration["myBase"]));

            });
            services.AddAuthentication(a =>
            {
                a.DefaultAuthenticateScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                a.DefaultSignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                a.DefaultChallengeScheme = CookieAuthenticationDefaults.AuthenticationScheme;

            }).AddCookie(a =>
            {
                a.LoginPath = "/Token/login";
                a.AccessDeniedPath = "/Token/Login";
                a.Cookie.Name = CookieAuthenticationDefaults.AuthenticationScheme;
                a.Cookie.HttpOnly = true;
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",

                    pattern: "{controller=Login}/{action=login}/{id?}");

            });
        }
    }
}
