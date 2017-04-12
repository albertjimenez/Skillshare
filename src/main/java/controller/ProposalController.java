package controller;

import dao.ProposalDao;
import model.proposal.Proposal;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 12/4/17. Project -> skillshare
 */

@Controller
public class ProposalController {

    private ProposalDao proposalDao;

    @Autowired
    private HttpSession httpSession;


    @Autowired
    public void setProposalDao(ProposalDao proposalDao) {
        this.proposalDao = proposalDao;
    }


    @RequestMapping(value = "/proposal/list")
    public String getProposalByNif(Model model) {
        if (!getSessionStudent())
            return "redirect:../login/login.html";
        Student student = (Student) httpSession.getAttribute("user");
        String name = student.getName().split("\\s+")[0];
        model.addAttribute("student", student);
        model.addAttribute("name", name);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        List<Proposal> l = proposalDao.getProposalsByNif(student.getNif());
        model.addAttribute("proposals", l);
        model.addAttribute("count", l.size());
//        model.addAttribute("proposals", proposalDao.getProposalsByNif(student.getNif()));
        return "proposal/list";

    }

    private boolean getSessionStudent() {
        Student student = (Student) httpSession.getAttribute("user");
        return student != null;
    }

}
