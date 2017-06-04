package controller;

import controller.validator.ProposalValidator;
import dao.ProposalDao;
import dao.SkillDao;
import model.Tools.Pair;
import model.proposal.Proposal;
import model.request.Request;
import model.skill.Skill;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 12/4/17. Project -> skillshare
 */

@Controller
public class ProposalController {

    private ProposalDao proposalDao;
    private SkillDao skillDao;

    @Autowired
    private HttpSession httpSession;

    private static final String LOGIN_URL = "redirect:../login/login.html";


    @Autowired
    public void setProposalDao(ProposalDao proposalDao) {
        this.proposalDao = proposalDao;
    }

    @Autowired
    public void setSkillDao(SkillDao skillDao) {
        this.skillDao = skillDao;
    }

    @RequestMapping("/proposal/all")
    public String getAllProposals(Model model) {
        if (!getSessionStudent())
            return LOGIN_URL;
        Student student = (Student) httpSession.getAttribute("user");
        String name = getStudentName();
        model.addAttribute("student", student);
        model.addAttribute("name", name);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        List<Proposal> l = proposalDao.getProposals();
        model.addAttribute("proposals", l);
        model.addAttribute("count", l.size());

        if (student.getType() == Type.CP)
            model.addAttribute("cp", "-");
        return "proposal/all";

    }

    @RequestMapping(value = "/proposal/list")
    public String getProposalByNif(Model model) {
        if (!getSessionStudent())
            return LOGIN_URL;
        Student student = (Student) httpSession.getAttribute("user");
        String name = getStudentName();
        model.addAttribute("student", student);
        model.addAttribute("name", name);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        List<Proposal> l = proposalDao.getProposalsByNif(student.getNif());
        model.addAttribute("proposals", l);
        model.addAttribute("count", l.size());

        if (student.getType() == Type.CP)
            model.addAttribute("cp", "-");
        return "proposal/list";

    }

    @RequestMapping(value = "/proposal/create")
    public String createProposal(Model model) {
        if (!getSessionStudent())
            return LOGIN_URL;
        Student student = (Student) httpSession.getAttribute("user");
        String name = getStudentName();
        model.addAttribute("name", name);
        model.addAttribute("type", getType());
        model.addAttribute("student", student);
        model.addAttribute("listSkillnames", skillDao.listSkillNames());
        model.addAttribute("newproposal", new Proposal());

        GregorianCalendar calendar = new GregorianCalendar();
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        System.out.println("Calendario" + calendar.getTime().toString());


        if (student.getType() == Type.CP)
            model.addAttribute("cp", "-");


        return "proposal/create";
    }

    @RequestMapping(value = "/proposal/create", method = RequestMethod.POST)
    public String processCreateProposal(@ModelAttribute("newproposal") Proposal proposal,
                                        BindingResult bindingResult, Model model) {

        ProposalValidator proposalValidator = new ProposalValidator();
        proposalValidator.validate(proposal, bindingResult);
        model.addAttribute("listSkillnames", skillDao.listSkillNames());
        if (Type.getType(getType()) == Type.CP)
            model.addAttribute("cp", "-");
        if (!getSessionStudent())
            return LOGIN_URL;
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores \n" + proposal);
            return "proposal/create";

        }
        if (proposal.getFinishDate() == null || proposal.getInitialDate() == null)
            return "proposal/create";
        System.out.println(proposal);
        Student student = (Student) httpSession.getAttribute("user");
        String name = getStudentName();
        model.addAttribute("name", name);
        model.addAttribute("type", getType());
        model.addAttribute("student", student);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        model.addAttribute("listSkillnames", skillDao.listSkillNames());


        Skill aSkill = new Skill(proposal.getSkillName(), proposal.getLevel(), "Creada automáticamente");
        skillDao.addSkill(aSkill);

        //Setting
        proposal.setNif(student.getNif());
        proposalDao.createProposal(proposal);
        System.out.println(proposal);
        List<Proposal> l = proposalDao.getProposalsByNif(student.getNif());
        model.addAttribute("proposals", l);
        model.addAttribute("count", l.size());

        return "proposal/list";
    }

    @RequestMapping(value = "/proposal/detail/{id}")
    public String detailedProposal(@PathVariable(value = "id") String id,
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
        Pair<Student, Proposal> pair;
        try {

            model.addAttribute("id", id);
            pair = proposalDao.getProposalByID(new AtomicInteger(Integer.parseInt(id)));
            if (pair != null) {
                model.addAttribute("student_proposal", pair.getLeft());
                model.addAttribute("proposal", pair.getRight());
            }
        } catch (NumberFormatException e) {
            return "proposal/error";
        }


        return pair == null ? "proposal/error" : "proposal/detail";

    }

    @RequestMapping(value = "/proposal/detail/{id}", method = RequestMethod.POST)
    public String processCollaborationFromProposal(@ModelAttribute("newrequest")
                                                           Request request,
                                                   BindingResult bindingResult, Model model) {
        return "request/detail";
    }

    @RequestMapping(value = "/proposal/detail")
    public String detailedProposalGeneric(Model model) {
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
        List<Proposal> l = proposalDao.getProposalsByNif(student.getNif());
        model.addAttribute("proposals", l);
        model.addAttribute("count", l.size());
        return "proposal/list";
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
