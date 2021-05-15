using Application.Features.TicketFeatures.Commands.UpdateStatusTicketByIdCommand;
using FluentValidation;

namespace WebApi.Validators
{
    public class UpdateStatusTicketByIdCommandValidator : AbstractValidator<UpdateStatusTicketByIdCommand>
    {
        private enum Status
        {
            Open, Solved, Canceled
        };

        public UpdateStatusTicketByIdCommandValidator()
        {
            const string idRegex = "^[a-f\\d]{24}$";

            RuleFor(ticket => ticket.Id)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyId)
                .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure);

            RuleFor(ticket => ticket.Status)
                    .Cascade(CascadeMode.Stop)
                    .IsEnumName(typeof(Status), caseSensitive: false).WithMessage(ValidationErrors.InvalidStatus);
        }
    }
}
