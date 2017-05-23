package controller.validator;

import model.skill.Skill;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by Beruto and Pablo Berbel on 23/5/17. Project -> skillshare
 */
public class SkillValidator implements Validator {

    private boolean isRepeated;

    public SkillValidator(boolean isRepeated) {
        this.isRepeated = isRepeated;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.isAssignableFrom(Skill.class);
    }

    @Override
    public void validate(Object o, Errors errors) {
        if (!isRepeated) {
            errors.rejectValue("name", "error", ".");
            System.out.println("Ya existe en la BD y esto es un error");
        }
    }
}
