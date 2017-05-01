package controller;

import dao.BannedDao;
import dao.StudentDao;
import model.student.BannedStudent;
import model.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
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

/**
 * Created by Beruto and Pablo Berbel on 17/4/17. Project -> skillshare
 */
@Controller
public class BannedController {

    private BannedDao bannedDao;

    private StudentDao studentDao;

    @Autowired
    private HttpSession httpSession;

    @Autowired
    public void setBannedDao(BannedDao bannedDao) {
        this.bannedDao = bannedDao;
    }

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @RequestMapping(value = "/banned/ban")
    public String listBanned(Model model) {

        if (!getSessionStudent())
            return "redirect:../login/login.html";
        model.addAttribute("name", getStudentName());

        List<Student> l = new LinkedList<>();
        List<String> bannedList = bannedDao.getBanneds();
        for (String nif : bannedList)
            l.add(studentDao.getStudentByNif(nif));
        model.addAttribute("items", l);

        model.addAttribute("newbanned", new BannedStudent());
        return "banned/ban";

    }


    @RequestMapping(value = "banned/ban", method = RequestMethod.POST)
    public String createBannedModal(@ModelAttribute(value = "newbanned") BannedStudent b,
                                    BindingResult bindingResult,
                                    Model model) {
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "banned/ban";
        }
        bannedDao.ban(b.getNif());
        return "redirect:/banned/ban.html";
    }

    @RequestMapping(value = "/banned/delete/{nif}")
    public String deleteBanned(@PathVariable(value = "nif") String nif, Model model) {
        if (!getSessionStudent())
            return "redirect:../login/login.html";
        model.addAttribute("name", getStudentName());

        //Añado esto porque sino peta el modal JSP
        model.addAttribute("newbanned", new BannedStudent());
        bannedDao.deleteBanned(nif);

        //En principio no debería fallar
        List<Student> l = new LinkedList<>();
        List<String> bannedList = bannedDao.getBanneds();
        for (String s : bannedList)
            l.add(studentDao.getStudentByNif(s));
        model.addAttribute("items", l);


        return "banned/ban";

    }

    private boolean getSessionStudent() {
        Student student = (Student) httpSession.getAttribute("user");
        return student != null;
    }

    private String getStudentName() {
        Student student = (Student) httpSession.getAttribute("user");
        return student.getName();
    }
}
