package controller;

import controller.validator.RequestValidator;
import dao.ProposalDao;
import dao.RequestDao;
import dao.SkillDao;
import model.Tools.Pair;
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
//        model.addAttribute("newcollaboration", new Collaboration());
        model.addAttribute("newproposal", new Proposal());
        model.addAttribute("type", Type.getName(student.getType().toString()));
        Pair<Student, Request> pair;
        try {

            model.addAttribute("id", id);
            pair = requestDao.getRequestsByID(new AtomicInteger(Integer.parseInt(id)));
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
        System.out.println("mi propuesta->" + proposal);
//De path variable tengo un id y el otro está en la propuesta, en la descripcion de proposal
        //esta el numero de horas
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
