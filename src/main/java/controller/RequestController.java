package controller;

import controller.validator.RequestValidator;
import dao.CollaborationDao;
import dao.ProposalDao;
import dao.RequestDao;
import dao.SkillDao;
import model.Tools.Pair;
import model.collaboration.Collaboration;
import model.proposal.Proposal;
import model.request.Request;
import model.skill.Level;
import model.skill.Skill;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 29/4/17. Project -> skillshare
 */
@Controller
public class RequestController {

    private RequestDao requestDao;

    private ProposalDao proposalDao;

    private SkillDao skillDao;
    private CollaborationDao collaborationDao;


    @Autowired
    private HttpSession httpSession;

    private static final String LOGIN_URL = "redirect:../login/login.html";
    private static final Integer DEFAULT_HOURS = 2;

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
        if (l.isEmpty())
            model.addAttribute("tour2", "--");
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
    public String processCreateRequest(@ModelAttribute("newrequest") Request request,
                                       BindingResult bindingResult, Model model) {

        RequestValidator requestValidator = new RequestValidator();
        requestValidator.validate(request, bindingResult);

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
        request.setNif(student.getNif());
        System.out.println(request);
        requestDao.createRequest(request);
        List<Request> l = requestDao.getRequestsByNif(student.getNif());
        model.addAttribute("requests", l);
        model.addAttribute("count", l.size());
        return "request/list";

    }

    @RequestMapping(value = "/request/detail/{id}")
    public String detailedRequest(@PathVariable(value = "id") String id,
                                  Model model) {

        if (!getSessionStudent())
            return "redirect:../../login/login.html";
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");

        Student student = (Student) httpSession.getAttribute("user");
        String name = getStudentName();
        model.addAttribute("name", name);
        model.addAttribute("type", getType());
        model.addAttribute("student", student);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        model.addAttribute("newproposal", new Proposal());
        Pair<Student, Request> pair;
        try {

            model.addAttribute("id", id);
            pair = requestDao.getRequestByID(new AtomicInteger(Integer.parseInt(id)));
            loadRelativeProposals(pair, model, student);
        } catch (NumberFormatException e) {
            return "request/error";
        }


        return pair == null ? "request/error" : "request/detail";

    }

    @RequestMapping(value = "/request/detail/{id}", method = RequestMethod.POST)
    public String processCollaborationFromRequest(@PathVariable(value = "id") String id,
                                                  @ModelAttribute("newproposal")
                                                          Proposal proposal,
                                                  BindingResult bindingResult, Model model) {

        if (!getSessionStudent())
            return "redirect:../../login/login.html";
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");

        Student student = (Student) httpSession.getAttribute("user");
        String name = getStudentName();
        model.addAttribute("name", name);
        model.addAttribute("type", getType());
        model.addAttribute("student", student);
        model.addAttribute("type", Type.getName(student.getType().toString()));

        //TODO Y también poner el modulo de limite de 20 horas
        System.out.println("Propuesta de las mias->" + proposal);
        Pair<Student, Proposal> pairProposal = null;
        AtomicInteger idFromParam;

        try {
            idFromParam = new AtomicInteger(Integer.parseInt(id));
        } catch (NumberFormatException e2) {
            System.out.println("Error con la id");
            return "request/error";
        }
        Pair<Student, Request> myRequestFromParam = requestDao.getRequestByID(idFromParam);
        loadRelativeProposals(myRequestFromParam, model, student);


        try {
            String[] elements = proposal.getSkillName().split("-");
            AtomicInteger myID = new AtomicInteger(Integer.parseInt(elements[0]));
            pairProposal = proposalDao.getProposalByID(myID);
            System.out.println("Propuesta de las mias->" + pairProposal.getRight());

        } catch (NumberFormatException e) {
            System.out.println("Error con la id");
            return "request/error";
        } catch (NullPointerException n) {
            //Copy the request -> proposal
            proposalDao.createAutoproposal(student.getNif(), myRequestFromParam.getRight());
            List<Proposal> newAutoProposal = proposalDao.getProposalWithSkills
                    (myRequestFromParam.getRight().getSkillName(), student.getNif());
            //last proposal
            Proposal p = newAutoProposal.get(newAutoProposal.size() - 1);
            Collaboration collaboration = Collaboration.factoryCollaboration(pairProposal.getRight().getId(),
                    idFromParam, proposal.getDescription());
            if (requestDao.alreadyCollaborating(myRequestFromParam.getRight().getId()) || !collaborationDao.insertCollab(collaboration))
                model.addAttribute("duplicated", "--");
            else {
                model.addAttribute("correct", "--");
                return "request/detail";
            }
        }
        //IF is not an autoproposal

        System.out.println("La request que capturo del param: " + myRequestFromParam.getRight());
        //Put collab on DB


        Collaboration collaboration = Collaboration.factoryCollaboration(pairProposal.getRight().getId(),
                idFromParam, proposal.getDescription());

        if (!collaborationDao.insertCollab(collaboration))
            model.addAttribute("duplicated", "--");
        else
            model.addAttribute("correct", "--");

        return "request/detail";

    }


    @RequestMapping(value = "/request/detail")
    public String detailedRequestGeneric(Model model) {
        if (!getSessionStudent())
            return "redirect:../../login/login.html";
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");

        Student student = (Student) httpSession.getAttribute("user");
        String name = getStudentName();
        model.addAttribute("name", name);
        model.addAttribute("type", getType());
        model.addAttribute("student", student);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        List<Request> l = requestDao.getRequestsByNif(student.getNif());
        model.addAttribute("requests", l);
        model.addAttribute("count", l.size());
        return "request/list";
    }

    @RequestMapping("/request/all")
    public String getAllRequest(Model model) {
        if (!getSessionStudent())
            return LOGIN_URL;
        Student student = (Student) httpSession.getAttribute("user");
        String name = getStudentName();
        model.addAttribute("student", student);
        model.addAttribute("name", name);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        List<Request> l = requestDao.getRequests(student.getNif());
        model.addAttribute("requests", l);
        model.addAttribute("count", l.size());
        if (l.isEmpty())
            model.addAttribute("tour2", "-");

        if (student.getType() == Type.CP)
            model.addAttribute("cp", "-");
        return "request/all";

    }

    private void loadRelativeProposals(Pair<Student, Request> pair, Model model, Student student) {
        if (pair != null) {
            model.addAttribute("student_request", pair.getLeft());
            model.addAttribute("request", pair.getRight());
            List<Proposal> l = proposalDao.getProposalWithSkills
                    (pair.getRight().getSkillName(), student.getNif());
            List<String> skillNames = new LinkedList<>();
            for (Proposal p : l)
                skillNames.add(p.getId() + "-" + p.getSkillName() + "-" + Level.getLevelToString(p.getLevel()));

            System.out.println(l);
            System.out.println(skillNames);
            model.addAttribute("match_proposals", skillNames);
        }
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
