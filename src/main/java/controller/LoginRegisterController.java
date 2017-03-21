package controller;

import dao.StudentDao;
import model.login.LoginEntity;
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
        model.addAttribute("loginEntity", new LoginEntity());
        return "login/login";
    }

    @RequestMapping(value = "/login/login", method = RequestMethod.POST)
    public String processAndSubmit(@ModelAttribute("loginEntity") LoginEntity loginEntity,
                                   BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "/";
        }
        model.addAttribute("user", loginEntity.getUser());
        System.out.println(loginEntity);
        return "home/home_pc";
    }


    @RequestMapping(value = "login/banned")
    public String banned(Model model) {

        return "login/banned";
    }
}
