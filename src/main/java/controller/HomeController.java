package controller;

import dao.SkillDao;
import model.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

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
        Student student = (Student) httpSession.getAttribute("user");
        if (student == null)
            return "redirect:../login/login.html";

        model.addAttribute("skills", skillDao.getSkillsCollection());
        return "home/home_pc";
    }

    @RequestMapping(value = "home/home_student")
    public String homeStudent(Model model) {

        return "home/home_student";
    }
}
