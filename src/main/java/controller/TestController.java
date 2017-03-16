package controller;

import dao.SkillDao;
import dao.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Beruto and Pablo Berbel on 15/3/17. Project -> skillshare
 */

@Controller
@RequestMapping("/testing")
public class TestController {

    private SkillDao skillDao;
    private StudentDao studentDao;

    @Autowired
    public void setSkillDao(SkillDao skillDao) {
        this.skillDao = skillDao;
    }

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @RequestMapping("/listSkill")
    public String getSkillsCollection(Model model) {
        model.addAttribute("listSkills", skillDao.getSkillsCollection());
        return "testing/listSkill";
    }
    @RequestMapping("listProposals")
    public String getProposalColab(Model model){

        model.addAttribute("proposals",studentDao.getProposalsByStudent("1"));
        return "testing/listProposals";
    }
}
