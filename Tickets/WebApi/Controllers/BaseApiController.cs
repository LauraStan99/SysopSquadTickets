using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers.v1
{
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]")]

    public class BaseApiController : ControllerBase
    {
        protected IMediator Mediator;

        public BaseApiController(IMediator mediator)
        {
            this.Mediator = mediator;
        }
    }
}
