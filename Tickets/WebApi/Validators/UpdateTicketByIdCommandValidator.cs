using Application.Features.TicketFeatures.Commands.UpdateTicketByIdCommand;
using FluentValidation;

namespace WebApi.Validators
{
    public class UpdateTicketByIdCommandValidator : AbstractValidator<UpdateTicketByIdCommand>
    {
        private enum Status
        {
            Open, Solved, Canceled
        };

        private enum Priority
        {
            High, Medium, Low
        };

        public UpdateTicketByIdCommandValidator()
        {
            const string idRegex = "^[a-f\\d]{24}$";

            When(ticket => !string.IsNullOrEmpty(ticket.UserId), () =>
            {
                RuleFor(ticket => ticket.UserId)
                    .Cascade(CascadeMode.Stop)
                    .NotEmpty().WithMessage(ValidationErrors.EmptyUserId)
                    .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                    .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure);
            });
            
            When(ticket => !string.IsNullOrEmpty(ticket.ConsultantId), () =>
            {
                RuleFor(ticket => ticket.ConsultantId)
                    .Cascade(CascadeMode.Stop)
                    .NotEmpty().WithMessage(ValidationErrors.EmptyConsultantId)
                    .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                    .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure);
            });
           

            When(ticket => !string.IsNullOrEmpty(ticket.Status), () =>
            {
                RuleFor(ticket => ticket.Status)
                    .Cascade(CascadeMode.Stop)
                    .IsEnumName(typeof(Status), caseSensitive: false).WithMessage(ValidationErrors.InvalidStatus);
            });

            When(ticket => !string.IsNullOrEmpty(ticket.Priority), () =>
            {
                RuleFor(ticket => ticket.Priority)
                    .Cascade(CascadeMode.Stop)
                    .IsEnumName(typeof(Priority), caseSensitive: false).WithMessage(ValidationErrors.InvalidPriority);
            });
        }
    }
}
