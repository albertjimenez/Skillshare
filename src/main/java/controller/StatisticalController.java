package controller;

import com.google.gson.Gson;
import dao.*;
import model.Tools.StatisticalElement;
import model.collaboration.Collaboration;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 10/6/17. Project -> skillshare
 */
@Controller
public class StatisticalController {

    @Autowired
    private HttpSession httpSession;

    private RequestDao requestDao;
    private ProposalDao proposalDao;
    private SkillDao skillDao;
    private CollaborationDao collaborationDao;
    private StatisticalDao statisticalDao;


    private static final Gson gson = new Gson();

    @Autowired
    public void setStatisticalDao(StatisticalDao statisticalDao) {
        this.statisticalDao = statisticalDao;
    }

    @Autowired
    public void setCollaborationDao(CollaborationDao collaborationDao) {
        this.collaborationDao = collaborationDao;
    }

    @Autowired
    public void setRequestDao(RequestDao requestDao) {
        this.requestDao = requestDao;
    }

    @Autowired
    public void setSkillDao(SkillDao skillDao) {
        this.skillDao = skillDao;
    }

    @Autowired
    public void setProposalDao(ProposalDao proposalDao) {
        this.proposalDao = proposalDao;
    }


    @RequestMapping("/statistical/statistical")
    public String statisticalData(Model model) {

        List<Collaboration> list = statisticalDao.getAllCollaborations();
        List<StatisticalElement> statisticalElements = new LinkedList<>();
        for (Collaboration c : list)
            statisticalElements.add(new StatisticalElement
                    (c.getIdProposal() + "-" + c.getIdRequest(), c.getHours()));

        model.addAttribute("list", gson.toJson(statisticalElements));
        return "statistical/statistical";
    }


    @RequestMapping(value = "/hotSkills", method = RequestMethod.GET, produces = "application/json")
    public
    @ResponseBody
    String hotSkills() {
        List<Collaboration> list = statisticalDao.getAllCollaborations();
        List<StatisticalElement> statisticalElements = new LinkedList<>();
        for (Collaboration c : list)
            statisticalElements.add(new StatisticalElement
                    (c.getIdProposal() + "-" + c.getIdRequest(), c.getHours()));
        return statisticalElements.toString();
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


}
