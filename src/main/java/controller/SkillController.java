package controller;

import dao.SkillDao;
import model.skill.Level;
import model.skill.Skill;
import model.student.Student;
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
//            return "redirect:/";
        }
        if (getSessionStudent())
            model.addAttribute("name", getStudentName());
        skill.setName(tempSkill.getName());
        skill.setLevel(tempSkill.getLevel());
        skillDao.editSkill(skill);
        System.out.println("Skill-> " + skill);

        return "redirect:/home/home_pc.html";

    }

    @RequestMapping(value = "home/skill/delete/{name}/{level}")
    public String deleteSkill(@PathVariable(value = "name") String name,
                              @PathVariable(value = "level") String level, Model model) {
        if (getSessionStudent())
            model.addAttribute("name", getStudentName());
        skillDao.removeSkill(skillDao.findSkill(name, Level.getEnum(level)));
        return "redirect:../../../home_pc.html";
    }


    @RequestMapping(value = "home/skill/create")
    public String createSkill(Model model) {

        model.addAttribute("createskill", new Skill());
        if (getSessionStudent())
            model.addAttribute("name", getStudentName());
        return "home/skill/create";
    }


    @RequestMapping(value = "home/skill/create", method = RequestMethod.POST)
    public String processCreateSkill(@ModelAttribute(value = "createSkill") Skill skill,
                                     BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "home/skill/create";
        }
//        String name = Normalizer.normalize(skill.getName(), Normalizer.Form.NFC);
//        String description = Normalizer.normalize(skill.getDescription(), Normalizer.Form.NFC).replaceAll("[^\\\\p{ASCII}]","");
//        skill.setName(name);
//        skill.setDescription(description);
        System.out.println("Created skill" + skill);
        if (getSessionStudent())
            model.addAttribute("name", getStudentName());
        skillDao.addSkill(skill);
        return "redirect:/home/skill/create.html";

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


    private Skill tempSkill;
}
