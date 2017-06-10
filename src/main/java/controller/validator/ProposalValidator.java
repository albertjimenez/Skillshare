package controller.validator;

import model.proposal.Proposal;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.GregorianCalendar;

/**
 * Created by Beruto and Pablo Berbel on 21/4/17. Project -> skillshare
 */
public class ProposalValidator implements Validator {


    @Override
    public boolean supports(Class<?> aClass) {
        return Proposal.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Proposal aProposal = (Proposal) o;
        System.out.println("Propuesta en validación" + aProposal);

        if (aProposal.getFinishDate() == null) {
            errors.rejectValue("finishDate", "error", "Fecha vacía");
            return;
        }
        if (aProposal.getInitialDate() == null) {
            errors.rejectValue("initialDate", "error", "Fecha vacía");
            return;
        }
        if (aProposal.getFinishDate() == null || aProposal.getInitialDate() == null)
            return;
        if (aProposal.getFinishDate().before(aProposal.getInitialDate()))
            errors.rejectValue("finishDate", "error", "");
        if (aProposal.getFinishDate().equals(aProposal.getInitialDate())) {
            errors.rejectValue("initialDate", "error", "");
            errors.rejectValue("finishDate", "error", "");
        }
        if (aProposal.getFinishDate().before(new GregorianCalendar().getTime()) || aProposal.getInitialDate().before(new GregorianCalendar().getTime())) {
            errors.rejectValue("initialDate", "error", "");
            errors.rejectValue("finishDate", "error", "");
        }

    }
}
