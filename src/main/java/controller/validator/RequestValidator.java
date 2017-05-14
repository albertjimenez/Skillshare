package controller.validator;

import model.request.Request;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

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

    }
}
