using Application.Features.TicketFeatures.Queries.GetTicketByUserIdAndConsultantIdQuery;
using FluentValidation;

namespace WebApi.Validators
{
    public class GetTicketByUserIdAndConsultantIdQueryValidator : AbstractValidator<GetTicketByUserIdAndConsultantIdQuery>
    {
        public GetTicketByUserIdAndConsultantIdQueryValidator()
        {
            const string idRegex = "^[a-f\\d]{24}$";

            RuleFor(ticket => ticket.UserId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyUserId)
                .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure);

            RuleFor(ticket => ticket.ConsultantId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyConsultantId)
                .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure);
        }
    }
}
