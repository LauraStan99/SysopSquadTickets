using Application.Features.TicketFeatures.Commands.DeleteTicketByIdCommand;
using Application.Features.TicketFeatures.Commands.UpdateTicketByIdCommand;
using Application.Features.TicketFeatures.Commands.CreateTicketCommand;
using Application.Features.TicketFeatures.Queries.GetAllTicketsQuery;
using Application.Features.TicketFeatures.Queries.GetTicketByIdQuery;
using Application.Features.TicketFeatures.Queries.GetAllTicketsByUserIdQuery;
using Application.Features.TicketFeatures.Queries.GetAllTicketsByConsultantIdQuery;
using Application.Features.TicketFeatures.Queries.GetAllTicketsByStatusQuery;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System;
using Application.Features.TicketFeatures.Queries.GetTicketByUserIdAndConsultantIdQuery;
using Application.Features.TicketFeatures.Commands.UpdateStatusTicketByIdCommand;
using Microsoft.AspNetCore.Authorization;

namespace WebApi.Controllers.v1
{
    [ApiVersion("1.0")]
    public class TicketController : BaseApiController
    {
        public TicketController(IMediator mediator) : base(mediator) { }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [AllowAnonymous]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await Mediator.Send(new GetAllTicketsQuery()));
        }

        [HttpGet("{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [AllowAnonymous]
        public async Task<IActionResult> GetById(string id)
        {
            try { 
                return Ok(await Mediator.Send(new GetTicketByIdQuery(id)));
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpGet("userId/{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [AllowAnonymous]
        public async Task<IActionResult> GetAllByUserId(string id)
        {
            try
            {
                return Ok(await Mediator.Send(new GetAllTicketsByUserIdQuery(id)));
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpGet("consultantId/{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [AllowAnonymous]
        public async Task<IActionResult> GetAllByConsultantId(string id)
        {
            try
            {
                return Ok(await Mediator.Send(new GetAllTicketsByConsultantIdQuery(id)));
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpGet("status/{status}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [AllowAnonymous]
        public async Task<IActionResult> GetAllTicketsByStatus(string status)
        {
            try
            {
                return Ok(await Mediator.Send(new GetAllTicketsByStatusQuery(status)));
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpGet("ticket")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [AllowAnonymous]
        public async Task<IActionResult> GetTicketByUserIdAndConsultantId(GetTicketByUserIdAndConsultantIdQuery query)
        {
            try
            {
                return Ok(await Mediator.Send(query));
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpPost("create")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [AllowAnonymous]
        public async Task<IActionResult> Create([FromBody] CreateTicketCommand command)
        {
            var ticket = await Mediator.Send(command);

            if (ticket == null)
                return BadRequest();

            return Ok(ticket);
        }

        [HttpPatch("update/{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [AllowAnonymous]
        public async Task<IActionResult> Update(UpdateTicketByIdCommand command)
        {
            var ticket = await Mediator.Send(command);
            
            if (ticket == null)
                return NotFound();

            return NoContent();
        }

        [HttpPatch("update/status")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [AllowAnonymous]
        public async Task<IActionResult> UpdateStatus(UpdateStatusTicketByIdCommand command)
        {
            var ticket = await Mediator.Send(command);

            if (ticket == null)
                return NotFound();

            return NoContent();
        }

        [HttpDelete("{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(string id)
        {
            var deleted = await Mediator.Send(new DeleteTicketByIdCommand(id));

            if (deleted)
                return NoContent();
                
            return NotFound();
        }
    }
}
