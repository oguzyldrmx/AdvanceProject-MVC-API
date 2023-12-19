using Microsoft.AspNetCore.Mvc.Filters;

namespace Advance.API.Filters
{
    public class LogFilter : ResultFilterAttribute
    {
        public void OnResultExecuting(ResultExecutingContext context)
        {
            throw new System.NotImplementedException();
        }

        public void OnResultExecuted(ResultExecutedContext context)
        {
            throw new System.NotImplementedException();
        }
    }
}
