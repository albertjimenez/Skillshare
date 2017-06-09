package controller;

import dao.CollaborationDao;
import dao.ProposalDao;
import dao.RequestDao;
import model.Tools.Pair;
import model.collaboration.Collaboration;
import model.proposal.Proposal;
import model.request.Request;
import model.skill.Level;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 1/5/17. Project -> skillshare
 */

@Controller
public class CollaborationController {



    private CollaborationDao collaborationDao;
    private ProposalDao proposalDao;
    private RequestDao requestDao;

    @Autowired
    private HttpSession httpSession;


    @Autowired
    public void setRequestDao(RequestDao requestDao) {
        this.requestDao = requestDao;
    }

    @Autowired
    public void setProposalDao(ProposalDao proposalDao) {
        this.proposalDao = proposalDao;
    }

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
        List<Pair<Collaboration, Proposal>> l = collaborationDao.myCollaborationsFromProposal(student.getNif());
        List<Pair<Collaboration, Request>> l2 = collaborationDao.myCollaborationsFromRequest(student.getNif());
        model.addAttribute("collaborationsProposal", l);
        model.addAttribute("collaborationsRequest", l2);
        model.addAttribute("count", l.size() + l2.size());


        return "collaboration/list";
    }

    @RequestMapping("/collaboration/prop/detail/{idProposal}/{idRequest}")
    public String collaborationDetailProposal(@PathVariable("idProposal") String idProposal,
                                              @PathVariable("idRequest") String idRequest, Model model) {
        if (!getSessionStudent())
            return "redirect:../../../../login/login.html";
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");

        Student student = getStudent();
        String name = getStudentName();
        model.addAttribute("name", name);
        model.addAttribute("type", getType());
        model.addAttribute("student", student);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        try {
            AtomicInteger idPropAtomInt = new AtomicInteger(Integer.parseInt(idProposal));
            AtomicInteger idReqAtomInt = new AtomicInteger(Integer.parseInt(idRequest));
            model.addAttribute("collaboration", collaborationDao.
                    getCollaborationByIDs(idPropAtomInt, idReqAtomInt));
            Pair<Student, Request> pair = requestDao.getRequestByID(idReqAtomInt);
            model.addAttribute("proposal", pair.getRight());
            model.addAttribute("student_proposal", pair.getLeft());
            model.addAttribute("level", Level.getLevelToString(pair.getRight().getLevel()));

        } catch (NumberFormatException e) {
            System.out.println("Error con las ids");
            return "collaboration/error";
        }

        return "collaboration/prop/detail";
    }

    @RequestMapping("/collaboration/req/detail/{idProposal}/{idRequest}")
    public String collaborationDetailRequest(@PathVariable("idProposal") String idProposal,
                                             @PathVariable("idRequest") String idRequest, Model model) {
        if (!getSessionStudent())
            return "redirect:../../../../login/login.html";
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");

        Student student = getStudent();
        String name = getStudentName();
        model.addAttribute("name", name);
        model.addAttribute("type", getType());
        model.addAttribute("student", student);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        try {
            AtomicInteger idPropAtomInt = new AtomicInteger(Integer.parseInt(idProposal));
            AtomicInteger idReqAtomInt = new AtomicInteger(Integer.parseInt(idRequest));
            model.addAttribute("collaboration", collaborationDao.
                    getCollaborationByIDs(idPropAtomInt, idReqAtomInt));
            Pair<Student, Proposal> pair = proposalDao.getProposalByID(idPropAtomInt);
            model.addAttribute("request", pair.getRight());
            model.addAttribute("level", Level.getLevelToString(pair.getRight().getLevel()));
            model.addAttribute("student_request", pair.getLeft());
        } catch (NumberFormatException e) {
            System.out.println("Error con las ids");
            return "collaboration/error";
        }

        return "collaboration/req/detail";
    }

    @RequestMapping(value = "/collaboration/prop/detail/{idProposal}/{idRequest}", method = RequestMethod.POST)
    public String rateProposal(@PathVariable("idProposal") String idProposal,
                               @PathVariable("idRequest") String idRequest,
                               @ModelAttribute("collaboration") Collaboration collaboration, Model model) {
        if (!getSessionStudent())
            return "redirect:../../../../login/login.html";
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");

        Student student = getStudent();
        String name = getStudentName();
        model.addAttribute("name", name);
        model.addAttribute("type", getType());
        model.addAttribute("student", student);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        try {
            AtomicInteger idPropAtomInt = new AtomicInteger(Integer.parseInt(idProposal));
            AtomicInteger idReqAtomInt = new AtomicInteger(Integer.parseInt(idRequest));
            Collaboration recoveredCollab = collaborationDao.
                    getCollaborationByIDs(idPropAtomInt, idReqAtomInt);
            recoveredCollab.setRating(collaboration.getRating());
            Pair<Student, Request> pair = requestDao.getRequestByID(idReqAtomInt);
            model.addAttribute("proposal", pair.getRight());
            model.addAttribute("student_proposal", pair.getLeft());
            model.addAttribute("level", Level.getLevelToString(pair.getRight().getLevel()));
            model.addAttribute("collaboration", recoveredCollab);
            collaborationDao.rateCollaboration(recoveredCollab);

        } catch (NumberFormatException e) {
            System.out.println("Error con las ids");
            return "collaboration/error";
        }

        return "collaboration/prop/detail";

    }

    @RequestMapping(value = "/collaboration/req/detail/{idProposal}/{idRequest}", method = RequestMethod.POST)
    public String rateRequest(@PathVariable("idProposal") String idProposal,
                              @PathVariable("idRequest") String idRequest,
                              @ModelAttribute("collaboration") Collaboration collaboration, Model model) {

        if (!getSessionStudent())
            return "redirect:../../../../login/login.html";
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");

        Student student = getStudent();
        String name = getStudentName();
        model.addAttribute("name", name);
        model.addAttribute("type", getType());
        model.addAttribute("student", student);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        try {
            AtomicInteger idPropAtomInt = new AtomicInteger(Integer.parseInt(idProposal));
            AtomicInteger idReqAtomInt = new AtomicInteger(Integer.parseInt(idRequest));

            Collaboration recoveredCollab = collaborationDao.
                    getCollaborationByIDs(idPropAtomInt, idReqAtomInt);
            recoveredCollab.setRating(collaboration.getRating());

            Pair<Student, Proposal> pair = proposalDao.getProposalByID(idPropAtomInt);
            model.addAttribute("request", pair.getRight());
            model.addAttribute("level", Level.getLevelToString(pair.getRight().getLevel()));
            model.addAttribute("student_request", pair.getLeft());
            collaborationDao.rateCollaboration(recoveredCollab);
            model.addAttribute("collaboration", recoveredCollab);
        } catch (NumberFormatException e) {
            System.out.println("Error con las ids");
            return "collaboration/error";
        }

        return "collaboration/req/detail";
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
