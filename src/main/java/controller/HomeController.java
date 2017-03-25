package controller;

import dao.SkillDao;
import model.skill.Skill;
import model.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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


    //TODO editar funciona pero tienes que borrar todas las habilidades y meterlas en minusculas
    @RequestMapping(value = "home/home_pc")
    public String homePC(Model model) {
        Student student = (Student) httpSession.getAttribute("user");
        if (student == null)
            return "redirect:../login/login.html";

        model.addAttribute("skills", skillDao.getSkillsCollection());
        model.addAttribute("editskill", new Skill());
        return "home/home_pc";
    }


    @RequestMapping(value = "home/home_pc", method = RequestMethod.POST)
    public String homePCEditSkill(@ModelAttribute("editskill") Skill skill,
                                  BindingResult bindingResult,
                                  Model model) {
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "redirect:/";
        }

        model.addAttribute("data", getDataSkills());
        skillDao.editSkill(skill);
        return "/home/home_pc";


    }

    private Map<String, String> getDataSkills() {
        Map<String, String> data = new HashMap<String, String>();
        data.put("A", "ADVANCED");
        data.put("M", "MEDIUM");
        data.put("N", "NEWBIE");
        return data;
    }

    @RequestMapping(value = "home/home_student")
    public String homeStudent(Model model) {

        return "home/home_student";
    }
}
