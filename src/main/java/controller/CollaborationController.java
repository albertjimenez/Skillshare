package controller;

import dao.CollaborationDao;
import model.collaboration.Collaboration;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 1/5/17. Project -> skillshare
 */

@Controller
public class CollaborationController {


    private CollaborationDao collaborationDao;

    @Autowired
    private HttpSession httpSession;

    @Autowired
    public void setCollaborationDao(CollaborationDao collaborationDao) {
        this.collaborationDao = collaborationDao;
    }



    @RequestMapping("/collaboration/list")
    public String myCollaborations(Model model) {

        if (!getSessionStudent())
            return "redirect:../../login/login.html";
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");

        Student student = getStudent();
        String name = getStudentName();
        model.addAttribute("name", name);
        model.addAttribute("type", getType());
        model.addAttribute("student", student);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        List<Collaboration> l = collaborationDao.myCollaborationsFromProposal(student.getNif());
        List<Collaboration> l2 = collaborationDao.myCollaborationsFromRequest(student.getNif());
        model.addAttribute("collaborationsProposal", l);
        model.addAttribute("collaborationsRequest", l2);
        model.addAttribute("count", l.size() + l2.size());


        return "collaboration/list";
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
