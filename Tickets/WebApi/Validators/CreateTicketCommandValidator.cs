using Application.Features.TicketFeatures.Commands.CreateTicketCommand;
using FluentValidation;

namespace WebApi.Validators
{
    public class CreateTicketCommandValidator : AbstractValidator<CreateTicketCommand>
    {
        private enum Category
        {
            Software, Hardware, Hr
        };

        private enum Priority
        {
            High, Medium, Low
        };
        
        public CreateTicketCommandValidator()
        {
            const string idRegex = "^[a-f\\d]{24}$";

            RuleFor(ticket => ticket.UserId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyUserId)
                .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure);

            RuleFor(ticket => ticket.Title)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyTitle)
                .MinimumLength(2).WithMessage(ValidationErrors.ShortTitle);

            RuleFor(ticket => ticket.Description)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyDescription)
                .MinimumLength(2).WithMessage(ValidationErrors.ShortDescription);

            RuleFor(ticket => ticket.Category)
                    .Cascade(CascadeMode.Stop)
                    .NotEmpty().WithMessage(ValidationErrors.EmptyCategory)
                    .IsEnumName(typeof(Category), caseSensitive: false).WithMessage(ValidationErrors.InvalidCategory);

            RuleFor(ticket => ticket.Priority)
                    .Cascade(CascadeMode.Stop)
                    .NotEmpty().WithMessage(ValidationErrors.EmptyPriority)
                    .IsEnumName(typeof(Priority), caseSensitive: false).WithMessage(ValidationErrors.InvalidPriority);
        }
    }
}
