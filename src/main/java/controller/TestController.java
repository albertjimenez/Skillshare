package controller;

import dao.ProposalDao;
import dao.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Beruto and Pablo Berbel on 15/3/17. Project -> skillshare
 */

@Controller
//@RequestMapping("/testing")
public class TestController {


    private ProposalDao proposalDao;
    private StudentDao studentDao;


    @Autowired
    public void setProposalDao(ProposalDao proposalDao) {
        this.proposalDao = proposalDao;
    }


    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }


    @RequestMapping("/proposal")
    public String getProposalColab(Model model){
        model.addAttribute("propo", proposalDao.getProposals());
        return "testing/proposal";
    }




}
