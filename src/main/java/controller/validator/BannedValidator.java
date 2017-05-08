package controller.validator;

import model.student.BannedStudent;
import model.student.ErrorCode;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by Beruto and Pablo Berbel on 7/5/17. Project -> skillshare
 */
public class BannedValidator implements Validator {

    private ErrorCode code;

    public BannedValidator(ErrorCode errorCode) {
        this.code = errorCode;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.isAssignableFrom(BannedStudent.class);
    }

    @Override
    public void validate(Object o, Errors errors) {
        switch (code) {
            case ALREADY_BANNED:
                System.out.println("Ya está baneado");
                errors.rejectValue("nif", "", "");
                break;
            case NOT_EXISTS:
                System.out.println("No existe en la BD");
                errors.rejectValue("nif", "", "");
                break;
        }
    }
}
