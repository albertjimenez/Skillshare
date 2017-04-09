package controller.validator;

import model.login.LoginEntity;
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
        if (s == null)
            errors.rejectValue("user", "Error", "No existe el estudiante " + loginEntity.getUser());
        else if (s.getNif() == null)
            //Estudiante vacio por convenio la contraseña es incorrecta
            errors.rejectValue("password", "Error", "Contraseña incorrecta");

        else if (s.getNif().equals("BANEADO"))
            errors.rejectValue("user", "Error", "Estudiante baneado");
    }


}
