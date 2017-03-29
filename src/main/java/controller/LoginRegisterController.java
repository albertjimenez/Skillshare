package controller;

import dao.BannedDao;
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
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Beruto and Pablo Berbel on 20/3/17. Project -> skillshare
 */
@Controller
//@RequestMapping(value = "/login")
public class LoginRegisterController {

    private StudentDao studentDao;

    private BannedDao bannedDao;

    @Autowired
    HttpSession httpSession;

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @Autowired
    public void setBannedDao(BannedDao bannedDao) {
        this.bannedDao = bannedDao;
    }

    @RequestMapping(value = "/login/login")
    public String login(Model model) {

        model.addAttribute("loginEntity", new LoginEntity());
        if (httpSession.getAttribute("user") != null) {
            Student s = (Student) httpSession.getAttribute("user");
            if (bannedDao.isBanned(s.getNif()))
                return "redirect:../login/banned.html";
            return switchUserType(s);
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

        Student s = studentDao.getStudent(null, loginEntity.getUser(), loginEntity.getPassword());

        if (s == null)
            return "login/error_username";
        if (s.getNif() == null)
            return "login/error_pass";


        model.addAttribute("student", s);
        if (s.getNif().equals("BANEADO"))
            return "redirect:banned.html";
//        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("user", s);

        return s.getType() == Type.CP ? "redirect:../home/home_pc.html" : "redirect:../home/home_student.html";


    }


    @RequestMapping(value = "login/banned")
    public String banned(Model model) {

        return "login/banned";
    }



    @RequestMapping(value = "/login/logout")
    public String logout(Model model) {
        httpSession.invalidate();
        return "login/logout";
    }

    @RequestMapping(value = "register/register")
    public String register(Model model) {
        Student s = (Student) httpSession.getAttribute("user");
        if (s != null)
            return switchUserType(s);
        model.addAttribute("studentRegister", new Student());
        Map data = new HashMap<String, String>();
        data.put("NO", "Estudiante de grado");
        data.put("CP", "Promotor de colaboraciones");
        data.put("CM", "Miembro del consejo");
        data.put("MA", "Estudiante de máster");
        data.put("PG", "Estudiante de postgrado");
        model.addAttribute("UJI", data);


        return "register/register";

    }

    //TODO que pasa cuando el nombre de usuario ya existe?

    @RequestMapping(value = "register/register", method = RequestMethod.POST)
    public String processRegister(@ModelAttribute("studentRegister") Student student,
                                  BindingResult bindingResult,
                                  Model model) {

        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "/";
        }

        Student anotherStudent = studentDao.getStudent(student.getNif(), student.getEmail(), student.getPassword());

        //Al ser nulo, no existe y podemos registrarlo
        if (anotherStudent == null) {
            student.setNif(student.getNif().toUpperCase());
            studentDao.addStudent(student);
            return switchUserType(student);
        }

        //Si se encuentra en la base pero password incorrecta
        if (anotherStudent.getNif() == null)
            return "redirect:../login/error_pass";
        if (anotherStudent.getNif().equals("DUP"))
            return "redirect:../register/duplicated";
        //Finalmente sí tiene cuenta y la contraseña es correcta se le redirige  a su cuenta
        if (anotherStudent.getNif().equals("BANEADO"))
            return "redirect:../login/banned";

        else
            return switchUserType(student);

    }


    private String switchUserType(Student s) {
        System.out.println("MI estudiante switch es " + s.getType());
        return s.getType() == Type.CP ? "redirect:../home/home_pc.html" :
                "redirect:../home/home_student.html";

    }
}