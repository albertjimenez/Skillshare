package controller;

import controller.validator.LoginValidator;
import controller.validator.RegisterValidator;
import dao.BannedDao;
import dao.ProposalDao;
import dao.SkillDao;
import dao.StudentDao;
import model.login.LoginEntity;
import model.skill.Skill;
import model.student.LoginStatus;
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
import java.util.TreeMap;

/**
 * Created by Beruto and Pablo Berbel on 20/3/17. Project -> skillshare
 */
@Controller
public class LoginRegisterController {

    private StudentDao studentDao;

    private BannedDao bannedDao;

    private SkillDao skillDao;

    private ProposalDao proposalDao;

    @Autowired
    public void setProposalDao(ProposalDao proposalDao) {
        this.proposalDao = proposalDao;
    }

    @Autowired
    public void setSkillDao(SkillDao skillDao) {
        this.skillDao = skillDao;
    }

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
        Student s = studentDao.getStudent(null, loginEntity.getUser(), loginEntity.getPassword());
        LoginStatus.setStudent(s);
        LoginValidator loginValidator = new LoginValidator(s);
        loginValidator.validate(loginEntity, bindingResult);
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "login/login";
        }

        httpSession.setAttribute("user", s);
        if (s.getType() == Type.CP)
            model.addAttribute("cp", "-");
        return s.getType() == Type.CP ? "redirect:../home/home_pc.html" : "redirect:../home/home_student.html";


    }

//
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
        Map<String, String> data = new HashMap<String, String>();
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

        Student anotherStudent = studentDao.getStudent(student.getNif(), student.getEmail(), student.getPassword());
        RegisterValidator registerValidator = new RegisterValidator(anotherStudent);
        registerValidator.validate(student, bindingResult);
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "register/register";
        }


        student.setNif(student.getNif().toUpperCase());
        studentDao.addStudent(student);
        return switchUserType(student);

    }


    //HOME relate to CPStudent and Regular Student
    @RequestMapping(value = "home/home_pc")
    public String homePC(Model model) {

        if (!getSessionStudent())
            return "redirect:../login/login.html";
        model.addAttribute("name", getStudentName());
        model.addAttribute("type", getType());
        model.addAttribute("skills", skillDao.getSkillsCollection());
        model.addAttribute("editskill", new Skill());
        Student student = (Student) httpSession.getAttribute("user");
        System.out.println(student.getType() == Type.CP);
        System.out.println(student.getType());
        //TODO esto es lo que funciona
        if (student.getType() == Type.CP)
            model.addAttribute("cp", "-");
        else
            return "redirect:../home/home_student.html";
        return "home/home_pc";
    }

    @RequestMapping(value = "home/home_student")
    public String homeStudent(Model model) {
        if (!getSessionStudent())
            return "redirect:../login/login.html";


        Student student = (Student) httpSession.getAttribute("user");
        String name = student.getName().split("\\s+")[0];
        model.addAttribute("student", student);
        model.addAttribute("name", name);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        model.addAttribute("proposals", proposalDao.getProposalsByNif(student.getNif()));


        return "home/home_student";
    }


    private String switchUserType(Student s) {
        return s.getType() == Type.CP ? "redirect:../home/home_pc.html" :
                "redirect:../home/home_student.html";

    }

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

    @RequestMapping("/testings/test")
    public String testWS(Model model) {
        if (!getSessionStudent())
            return "redirect:../login/login.html";
        Student student = (Student) httpSession.getAttribute("user");
        String name = student.getName().split("\\s+")[0];
        model.addAttribute("student", student);
        model.addAttribute("name", name);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        return "testings/test";

    }

    private TreeMap<String, String> dataCareers() {
        TreeMap<String, String> map = new TreeMap<>();
        //TODO poner nombre de carreras
        return map;
    }




}
