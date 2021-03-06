package controller;

import controller.validator.SkillValidator;
import dao.SkillDao;
import model.skill.Level;
import model.skill.Skill;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by Beruto and Pablo Berbel on 25/3/17. Project -> skillshare
 */
@Controller
public class SkillController {

    @Autowired
    private HttpSession httpSession;

    private SkillDao skillDao;


    @Autowired
    public void setSkillDao(SkillDao skillDao) {
        this.skillDao = skillDao;
    }


    @RequestMapping(value = "home/skill/update/{name}/{level}")
    public String homePCEditSkill(@PathVariable(value = "name") String name,
                                  @PathVariable(value = "level") String level,
                                  Model model) {

        Skill skill = skillDao.findSkill(name, Level.getEnum(level));
        if (getSessionStudent())
            model.addAttribute("name", getStudentName());
        model.addAttribute("editskill", skill);
        tempSkill = skill;
        model.addAttribute("cp", "-");
        return "home/skill/update";

    }

    @RequestMapping(value = "home/skill/update/{name}/{level}", method = RequestMethod.POST)
    public String processEditSkill(@PathVariable(value = "name") String name,
                                   @PathVariable(value = "level") String level,
                                   @ModelAttribute(value = "editskill") Skill skill,
                                   BindingResult bindingResult,
                                   Model model) {
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "home/skill/update";
        }
        if (getSessionStudent())
            model.addAttribute("name", getStudentName());
        skill.setName(tempSkill.getName());
        skill.setLevel(tempSkill.getLevel());
        skillDao.editSkill(skill);
        System.out.println("Skill-> " + skill);
        model.addAttribute("cp", "-");
        return "redirect:/home/home_pc.html";

    }

    @RequestMapping(value = "home/skill/delete/{name}/{level}")
    public String deleteSkill(@PathVariable(value = "name") String name,
                              @PathVariable(value = "level") String level, Model model) {
        if (getSessionStudent())
            model.addAttribute("name", getStudentName());
        skillDao.removeSkill(skillDao.findSkill(name, Level.getEnum(level)));
        model.addAttribute("cp", "-");
        return "redirect:../../../home_pc.html";
    }


    @RequestMapping(value = "home/skill/create")
    public String createSkill(Model model) {

        model.addAttribute("createskill", new Skill());
        if (getSessionStudent())
            model.addAttribute("name", getStudentName());
        model.addAttribute("cp", "-");
        return "home/skill/create";
    }


    @RequestMapping(value = "home/skill/create", method = RequestMethod.POST)
    public String processCreateSkill(@ModelAttribute(value = "createskill") Skill skill,
                                     BindingResult bindingResult, Model model) {


        if (getSessionStudent())
            model.addAttribute("name", getStudentName());
        model.addAttribute("cp", "-");

        SkillValidator skillValidator = new SkillValidator(skillDao.addSkill(skill));
        skillValidator.validate(skill, bindingResult);
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            model.addAttribute("repeat", "x");
            return "home/skill/create";
        }
        System.out.println("Skill ->" + skill);

        model.addAttribute("create", "-");
        return "redirect:/home/home_pc.html";

    }


    /**
     * Valida si hay sesion
     *
     * @return true si hay sesion o false si es la primera vez que se accede
     */
    private boolean getSessionStudent() {
        Student student = (Student) httpSession.getAttribute("user");
        return student != null;
    }

    private String getStudentName() {
        Student student = (Student) httpSession.getAttribute("user");
        return student.getName();
    }


    private String getType() {
        Student student = (Student) httpSession.getAttribute("user");
        return Type.getName(student.getType().toString());
    }

    private Student getStudent() {
        return (Student) httpSession.getAttribute("user");
    }
    private Skill tempSkill;
}
