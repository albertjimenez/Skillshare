package controller;

import dao.StudentDao;
import model.login.LoginEntity;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by Beruto and Pablo Berbel on 20/3/17. Project -> skillshare
 */
@Controller
//@RequestMapping(value = "/login")
public class LoginRegisterController {

    private StudentDao studentDao;

    @Autowired
    HttpSession httpSession;

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }


    @RequestMapping(value = "/login/login")
    public String login(Model model) {

//        HttpSession httpSession = request.getSession();
        model.addAttribute("loginEntity", new LoginEntity());
        if (httpSession.getAttribute("user") != null) {
            Student s = (Student) httpSession.getAttribute("user");
            //TODO hacer una consulta para saber si el Student está baneado
            if (s.getType() == Type.CP)
                return "redirect:../home/home_pc.html";
            return "redirect:../home/home_student";
        }

        return "login/login";
    }

    /**
     * @param loginEntity
     * @param bindingResult
     * @param model
     * @return
     */
    @RequestMapping(value = "/login/login", method = RequestMethod.POST)
    public String processAndSubmit(@ModelAttribute("loginEntity") LoginEntity loginEntity,
                                   BindingResult bindingResult,
                                   Model model) {
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "/";
        }

        Student s = studentDao.getStudent(loginEntity.getUser(), loginEntity.getPassword());

        if (s == null)
            return "login/error_username";
        if (s.getNif() == null)
            return "login/error_pass";


        model.addAttribute("student", s);
        if (s.getNif().equals("BANEADO"))
            return "redirect:banned.html";
//        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("user", s);

        return s.getType() == Type.CP ? "redirect:../home/home_pc.html" : "redirect:../home/home_student";


    }


    @RequestMapping(value = "login/banned")
    public String banned(Model model) {

        return "login/banned";
    }


    //TODO Esto esta mal, ah no que es mio, entonces esta bien
    //na es broma, esto va a otro controlador
    @RequestMapping(value = "home/home_pc")
    public String homePC(Model model) {

        return "home/home_pc";
    }

    @RequestMapping(value = "/login/logout")
    public String logout(Model model) {
        httpSession.invalidate();
        return "login/logout";
    }
}
