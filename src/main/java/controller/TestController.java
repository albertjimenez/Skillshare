package controller;

import dao.SkillDao;
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

    @Autowired
    public void setSkillDao(SkillDao skillDao) {
        this.skillDao = skillDao;
    }

    @RequestMapping("/listSkill")
    public String getSkillsCollection(Model model) {
        model.addAttribute("listSkills", skillDao.getSkillsCollection());
        return "testing/listSkill";
    }
}
