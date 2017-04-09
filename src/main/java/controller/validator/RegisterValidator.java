package controller.validator;

import dao.StudentDao;
import model.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by Beruto and Pablo Berbel on 9/4/17. Project -> skillshare
 */
public class RegisterValidator implements Validator {

    private Student s;
    private StudentDao studentDao;

    public RegisterValidator(Student s) {
        this.s = s;
    }

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }


    public boolean supports(Class<?> aClass) {
        return Student.class.equals(aClass);
    }

    public void validate(Object o, Errors errors) {
        Student myFormStudent = (Student) o;

        if (s != null) {
            System.out.println("Algo pasa crack ->" + myFormStudent);
            if (s.getNif() != null && s.getNif().equals("DUP"))
                errors.rejectValue("nif", "Error", "Ya existe el estudiante " + myFormStudent.getName());
            if (myFormStudent.getCourse() < 1)
                errors.rejectValue("course", "Error", "Curso no válido");
        } else
            System.out.println("todo correcto jeje");
    }
}
