package controller.validator;

import model.request.Request;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.GregorianCalendar;

/**
 * Created by Beruto and Pablo Berbel on 15/5/17. Project -> skillshare
 */
public class RequestValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.isAssignableFrom(Request.class);
    }

    @Override
    public void validate(Object o, Errors errors) {

        Request request = (Request) o;
        System.out.println("Request en validación: " + request);
        if (request.getDescription() == null || request.getDescription().equals(""))
            errors.rejectValue("description", "error", "");


        if (request.getFinishDate() == null)
            errors.rejectValue("finishDate", "error", "");

        if (request.getInitialDate() == null)
            errors.rejectValue("initialDate", "error", "");

        if (request.getFinishDate() == null || request.getInitialDate() == null)
            return;
        if (request.getFinishDate().before(request.getInitialDate()))
            errors.rejectValue("finishDate", "error", "");
        if (request.getFinishDate().equals(request.getInitialDate())) {
            errors.rejectValue("initialDate", "error", "");
            errors.rejectValue("finishDate", "error", "");
        }
        if (request.getFinishDate().before(new GregorianCalendar().getTime()) || request.getInitialDate().before(new GregorianCalendar().getTime())) {
            errors.rejectValue("initialDate", "error", "");
            errors.rejectValue("finishDate", "error", "");
        }

    }
}
