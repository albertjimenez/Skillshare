package controller.validator;

import model.login.LoginEntity;
import model.student.LoginStatus;
import model.student.Student;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by Beruto and Pablo Berbel on 9/4/17. Project -> skillshare
 */
public class LoginValidator implements Validator {

    private Student s;

    public LoginValidator(Student s) {
        this.s = s;
    }

    public boolean supports(Class<?> aClass) {
        return LoginEntity.class.equals(aClass);
    }

    public void validate(Object o, Errors errors) {
        LoginEntity loginEntity = (LoginEntity) o;
        if (LoginStatus.getStatus(s) == LoginStatus.NOT_FOUND)
            errors.rejectValue("user", "Error", "No existe el estudiante " + loginEntity.getUser());

        else if (LoginStatus.getStatus(s) == LoginStatus.WRONG_PSWD)
            errors.rejectValue("password", "Error", "Contraseña incorrecta");

        else if (LoginStatus.getStatus(s) == LoginStatus.BANNED)
            errors.rejectValue("user", "Error", "Estudiante baneado");
    }


}
