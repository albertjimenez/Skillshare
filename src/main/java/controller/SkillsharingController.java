package controller;

import dao.SkillDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Beruto on 12/3/17.
 */

@Controller
public class SkillsharingController {

    private SkillDao skillDao;

    @Autowired
    public void setSkillDao(SkillDao skillDao) {
        this.skillDao = skillDao;
    }

    @RequestMapping("/testing/listSkill")
    public String getSkillsCollection(Model model) {
        model.addAttribute("listSkills", skillDao.getSkillsCollection());
        return "testing/listSkill";
    }


}
