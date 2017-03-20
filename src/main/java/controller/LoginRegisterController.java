package controller;

import dao.StudentDao;
import model.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Beruto and Pablo Berbel on 20/3/17. Project -> skillshare
 */
@Controller
//@RequestMapping(value = "/login")
public class LoginRegisterController {

    private StudentDao studentDao;

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }


    @RequestMapping(value = "/login/login")
    public String login(Model model) {
//TODO if hay session y no esta baneado -> redirect to Home else return "login/login"
        model.addAttribute("student", new Student());
        return "login/login";
    }

    @RequestMapping(value = "/login/login", method = RequestMethod.POST)
    public String processLogin(@ModelAttribute("student") Student student, Model model, BindingResult bindingResult) {
        if (bindingResult.hasErrors())
            return "/";

        if (studentDao.getStudent(student.getEmail(), student.getPassword()) != null)
            return "login/login";
        return "home/home_pc";
    }


    @RequestMapping(value = "login/banned")
    public String banned(Model model) {

        return "login/banned";
    }
}
