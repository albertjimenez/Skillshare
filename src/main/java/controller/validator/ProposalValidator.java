package controller.validator;

import model.proposal.Proposal;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.Calendar;
import java.util.Date;
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
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "initialDate", "Error", "Fecha vacía");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "finishDate", "Error", "Fecha vacía");

        if (aProposal.getFinishDate() == null) {
            errors.rejectValue("finishDate", "error", "Fecha vacía");
            return;
        }
        if (aProposal.getInitialDate() == null) {
            errors.rejectValue("initialDate", "error", "Fecha vacía");
            return;
        }


        GregorianCalendar calendar = new GregorianCalendar();
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        aProposal.setInitialDate(new Date(new GregorianCalendar(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 1).getTimeInMillis()));
        System.out.println("Calendario" + calendar.getTime().toString());
        if (aProposal.getFinishDate().before(aProposal.getInitialDate()))
            errors.rejectValue("finishDate", "error", "La fecha seleccionada es anterior que la inicial");
        if (aProposal.getInitialDate().before(calendar.getTime()))
            errors.rejectValue("initialDate", "error", "La fecha seleccionada es anterior a la actual");


        if (aProposal.getFinishDate().before(calendar.getTime()))
            errors.rejectValue("finishDate", "error", "La fecha seleccionada es anterior a la actual");
    }
}
