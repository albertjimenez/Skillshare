package controller;

import dao.RequestDao;
import model.request.Request;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 29/4/17. Project -> skillshare
 */
@Controller
public class RequestController {

    private RequestDao requestDao;

    @Autowired
    private HttpSession httpSession;

    @Autowired
    public void setRequestDao(RequestDao requestDao) {
        this.requestDao = requestDao;
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
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");
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
