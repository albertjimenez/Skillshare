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
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Beruto and Pablo Berbel on 25/3/17. Project -> skillshare
 */
@Controller
public class HomeController {

    @Autowired
    private HttpSession httpSession;

    private SkillDao skillDao;

    @Autowired
    public void setSkillDao(SkillDao skillDao) {
        this.skillDao = skillDao;
    }


    @RequestMapping(value = "home/home_pc")
    public String homePC(Model model) {

        if (!getSessionStudent())
            return "redirect:../login/login.html";
//        Student student = (Student) httpSession.getAttribute("user");
        model.addAttribute("skills", skillDao.getSkillsCollection());
        model.addAttribute("editskill", new Skill());
        return "home/home_pc";
    }


    //    @RequestMapping(value = "home/home_pc/update/{name}" , method = RequestMethod.GET)
//    public String homePCEditSkill(@PathVariable(value = "name") String name,
//                                  Model model) {
//        System.out.println("hola");
//        model.addAttribute("editskill",skillDao.findSkillByName(name));
//        return "/home/home_pc/update";
//
//    }
    @RequestMapping(value = "home/skill/update/{name}/{level}")
    public String homePCEditSkill(@PathVariable(value = "name") String name,
                                  @PathVariable(value = "level") String level,
                                  Model model) {
        Skill skill = skillDao.findSkill(name, Level.getEnum(level));
        System.out.println("EN BLANCO? " + skill);
        model.addAttribute("editskill", skill);
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
            return "redirect:/";
        }
        skillDao.editSkill(skill);
        return "redirect:../../../home_pc.html";

    }

    @RequestMapping(value = "home/skill/delete/{name}/{level}")
    public String deleteSkill(@PathVariable(value = "name") String name,
                              @PathVariable(value = "level") String level, Model model) {
        skillDao.removeSkill(skillDao.findSkill(name, Level.getEnum(level)));
        return "redirect:../../../home_pc.html";
    }

    private Map<String, String> getDataSkills() {
        Map<String, String> data = new HashMap<String, String>();
        data.put("A", "ADVANCED");
        data.put("M", "MEDIUM");
        data.put("N", "NEWBIE");
        return data;
    }

    @RequestMapping(value = "home/skill/create")
    public String createSkill(Model model) {
        model.addAttribute("createskill", new Skill());
        return "home/skill/create";
    }


    @RequestMapping(value = "home/skill/create", method = RequestMethod.POST)
    public String processCreateSkill(@ModelAttribute(value = "createSkill") Skill skill,
                                     BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "redirect:/";
        }
        System.out.println("Created skill" + skill);
        skillDao.addSkill(skill);
        return "redirect:/home/skill/create.html";

    }


    //TODO acuerdate de que esto no va aqui

    @RequestMapping(value = "home/home_student")
    public String homeStudent(Model model) {
        if (!getSessionStudent())
            return "redirect:../login/login.html";
        return "home/home_student";
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
}
