package controller;

import com.google.gson.Gson;
import dao.StatisticalDao;
import model.Tools.StatisticalElement;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 10/6/17. Project -> skillshare
 */
@Controller
public class StatisticalController {

    private final String CP_STRING = "Promotor de colaboraciones";

    @Autowired
    private HttpSession httpSession;

    private StatisticalDao statisticalDao;


    private static final Gson gson = new Gson();

    @Autowired
    public void setStatisticalDao(StatisticalDao statisticalDao) {
        this.statisticalDao = statisticalDao;
    }

    @RequestMapping("/statistical/statistical")
    public String statisticalData(Model model) {
        if (!getSessionStudent())
            return "redirect:../login/login.html";

        model.addAttribute("name", getStudentName());
        model.addAttribute("type", getType());

        if (!getType().equals(CP_STRING))
            return "home/home_student";


        model.addAttribute("plotCollaborations", gson.toJson(plotCollaborations()));
        model.addAttribute("plotMostSkills", gson.toJson(demandedSkills()));
        model.addAttribute("degreesMoreCollaborative", gson.toJson(degreesMoreCollaborative()));

        return "statistical/statistical";
    }

    private List<StatisticalElement> plotCollaborations() {
        List<StatisticalElement> statisticalElements = new LinkedList<>();
        statisticalElements.add(new StatisticalElement("Ofertas sin atender",
                statisticalDao.pendingProposals()));
        statisticalElements.add(new StatisticalElement("Demandas sin atender",
                statisticalDao.pendingRequests()));
        statisticalElements.add(new StatisticalElement("Colaboraciones a partir de ofertas",
                statisticalDao.collaborationsOnProposals()));
        statisticalElements.add(new StatisticalElement("Colaboraciones a partir de demandas",
                statisticalDao.collaborationsOnRequests()));
        return statisticalElements;
    }

    private List<StatisticalElement> demandedSkills() {
        return statisticalDao.demandedSkills();
    }

    private List<StatisticalElement> degreesMoreCollaborative() {
        return statisticalDao.degreesMoreCollaborative();
    }

//    private List<StatisticalElement> plotHours() {
//        List<StatisticalElement> statisticalElements = new LinkedList<>();
//        statisticalElements.add(new StatisticalElement("Horas empleadas en ofertas",
//                statisticalDao.hoursOnProposal()));
//        statisticalElements.add(new StatisticalElement("Horas empleadas en demandas",
//                statisticalDao.hoursOnRequest()));
//        return statisticalElements;
//
//    }

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
