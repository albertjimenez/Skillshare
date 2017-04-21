package controller.validator;

import model.student.LoginStatus;
import model.student.Student;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by Beruto and Pablo Berbel on 9/4/17. Project -> skillshare
 */
public class RegisterValidator implements Validator {

    private Student s;

    //TODO crea un booleano en el constructor que sea fruto de que el DAO tenga un metodo para comprobar
    //si nickname está disponible

    public RegisterValidator(Student s) {
        this.s = s;
    }


    public boolean supports(Class<?> aClass) {
        return Student.class.equals(aClass);
    }

    public void validate(Object o, Errors errors) {
        Student myFormStudent = (Student) o;

        if (s != null) {
            if (LoginStatus.getStatus(s) == LoginStatus.DUPLICATED)
                errors.rejectValue("nif", "Error", "Ya existe el estudiante " + myFormStudent.getName());
            if (myFormStudent.getCourse() < 1)
                errors.rejectValue("course", "Error", "Curso no válido");
        } else
            System.out.println("todo correcto jeje");
    }
}
