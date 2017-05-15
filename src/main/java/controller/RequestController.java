package controller;

import dao.RequestDao;
import dao.SkillDao;
import model.request.Request;
import model.skill.Skill;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 29/4/17. Project -> skillshare
 */
@Controller
public class RequestController {

    private RequestDao requestDao;

    private SkillDao skillDao;

    @Autowired
    private HttpSession httpSession;

    @Autowired
    public void setRequestDao(RequestDao requestDao) {
        this.requestDao = requestDao;
    }

    @Autowired
    public void setSkillDao(SkillDao skillDao) {
        this.skillDao = skillDao;
    }

    @RequestMapping(value = "/request/list")
    public String listRequests(Model model) {

        if (!getSessionStudent())
            return "redirect:../login/login.html";
        model.addAttribute("name", getStudentName());
        model.addAttribute("type", getType());

        Student student = getStudent();
        List<Request> l = requestDao.getRequestsByNif(student.getNif());
        model.addAttribute("requests", l);
        model.addAttribute("count", l.size());
        if (student.getType() == Type.CP)
            model.addAttribute("cp", "-");
        return "request/list";
    }

    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @RequestMapping(value = "/request/create")
    public String createRequest(Model model) {
        if (!getSessionStudent())
            return "redirect:../login/login.html";
        model.addAttribute("name", getStudentName());
        model.addAttribute("type", getType());
        Student student = getStudent();
        Request request = new Request();
        model.addAttribute("listSkillnames", skillDao.listSkillNames());
        model.addAttribute("newrequest", request);
        if (student.getType() == Type.CP)
            model.addAttribute("cp", "-");
        return "/request/create";


    }


    @RequestMapping(value = "/request/create", method = RequestMethod.POST)
    public String processCreateProposal(@ModelAttribute("newrequest") Request request,
                                        BindingResult bindingResult, Model model) {

        if (!getSessionStudent())
            return "redirect:../login/login.html";
        model.addAttribute("name", getStudentName());
        model.addAttribute("type", getType());
        Student student = getStudent();
        model.addAttribute("listSkillnames", skillDao.listSkillNames());
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");
        if (!getSessionStudent())
            return "redirect:../login/login.html";
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores \n" + request);
            return "request/create";

        }
        //If it does not exists on DB
        Skill aSkill = new Skill(request.getSkillName(), request.getLevel(), "Creada automáticamente");
        skillDao.addSkill(aSkill);
        System.out.println(request);
        //TODO finish him!


        List<Request> l = requestDao.getRequestsByNif(student.getNif());
        model.addAttribute("requests", l);
        return "request/list";

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

    private Student getStudent() {
        return (Student) httpSession.getAttribute("user");
    }
}
