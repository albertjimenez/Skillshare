package controller;

import com.google.gson.Gson;
import controller.validator.LoginValidator;
import controller.validator.RegisterValidator;
import dao.BannedDao;
import dao.ProposalDao;
import dao.SkillDao;
import dao.StudentDao;
import model.login.LoginEntity;
import model.skill.Skill;
import model.student.LoginStatus;
import model.student.Student;
import model.student.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by Beruto and Pablo Berbel on 20/3/17. Project -> skillshare
 */
@Controller
public class LoginRegisterController {

    private StudentDao studentDao;

    private BannedDao bannedDao;

    private SkillDao skillDao;

    private ProposalDao proposalDao;

    @Autowired
    public void setProposalDao(ProposalDao proposalDao) {
        this.proposalDao = proposalDao;
    }

    @Autowired
    public void setSkillDao(SkillDao skillDao) {
        this.skillDao = skillDao;
    }

    @Autowired
    HttpSession httpSession;

    @Autowired
    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @Autowired
    public void setBannedDao(BannedDao bannedDao) {
        this.bannedDao = bannedDao;
    }

    private static boolean registered = false;

    @RequestMapping(value = "/login/login")
    public String login(Model model) {

        model.addAttribute("loginEntity", new LoginEntity());
        if (httpSession.getAttribute("user") != null) {
            Student s = (Student) httpSession.getAttribute("user");
            if (bannedDao.isBanned(s.getNif()))
                return "redirect:../login/banned.html";
            return switchUserType(s);
        }

        return "login/login";
    }

    /**
     * @param loginEntity
     * @param bindingResult
     * @param model
     * @return
     */
    @RequestMapping(value = "/login/login", method = RequestMethod.POST)
    public String processAndSubmit(@ModelAttribute("loginEntity") LoginEntity loginEntity,
                                   BindingResult bindingResult,
                                   Model model) {
        Student s = studentDao.getStudent(null, loginEntity.getUser(), loginEntity.getPassword());
        LoginStatus.setStudent(s);
        LoginValidator loginValidator = new LoginValidator(s);
        loginValidator.validate(loginEntity, bindingResult);
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "login/login";
        }

        httpSession.setAttribute("user", s);
        if (s.getType() == Type.CP)
            model.addAttribute("cp", "-");
        return s.getType() == Type.CP ? "redirect:../home/home_pc.html" : "redirect:../home/home_student.html";


    }

    //
    @RequestMapping(value = "login/banned")
    public String banned(Model model) {

        return "login/banned";
    }


    @RequestMapping(value = "/login/logout")
    public String logout(Model model) {

        httpSession.invalidate();
        return "login/logout";
    }

    @RequestMapping(value = "register/register")
    public String register(Model model) {
        Student s = (Student) httpSession.getAttribute("user");
        if (s != null)
            return switchUserType(s);
        model.addAttribute("studentRegister", new Student());
        Map<String, String> data = new HashMap<String, String>();
        data.put("NO", "Estudiante de grado");
        data.put("CP", "Promotor de colaboraciones");
        data.put("CM", "Miembro del consejo");
        data.put("MA", "Estudiante de máster");
        data.put("PG", "Estudiante de postgrado");
        model.addAttribute("UJI", data);
        model.addAttribute("degrees", dataDegrees());
        model.addAttribute("masters", dataMasters());
        model.addAttribute("success", "success");


        return "register/register";

    }

    //TODO que pasa cuando el nombre de usuario ya existe?

    @RequestMapping(value = "register/register", method = RequestMethod.POST)
    public String processRegister(@ModelAttribute("studentRegister") Student student,
                                  BindingResult bindingResult,
                                  Model model) {

        Student anotherStudent = studentDao.getStudent(student.getNif(), student.getEmail(), student.getPassword());
        RegisterValidator registerValidator = new RegisterValidator(anotherStudent);
        registerValidator.validate(student, bindingResult);
        if (bindingResult.hasErrors()) {
            System.out.println("Tiene errores");
            return "register/register";
        }


        student.setNif(student.getNif().toUpperCase());
        studentDao.addStudent(student);
        httpSession.setAttribute("user", student);
        registered = true;
        model.addAttribute("success", "Estudiante " + student.getName() + " registrado correctamente");
        return switchUserType(student);

    }


    //HOME relate to CPStudent and Regular Student
    @RequestMapping(value = "home/home_pc")
    public String homePC(Model model) {

        if (!getSessionStudent())
            return "redirect:../login/login.html";
        model.addAttribute("name", getStudentName());
        model.addAttribute("type", getType());
        model.addAttribute("skills", skillDao.getSkillsCollection());
        model.addAttribute("editskill", new Skill());
        Student student = (Student) httpSession.getAttribute("user");
        System.out.println(student.getType() == Type.CP);
        System.out.println(student.getType());
        if (registered) {
            model.addAttribute("success", "Estudiante " + student.getName() + " registrado correctamente");
            registered = false;
        }
        if (student.getType() == Type.CP)
            model.addAttribute("cp", "-");
        else
            return "redirect:../home/home_student.html";
        return "home/home_pc";
    }

    @RequestMapping(value = "home/home_student")
    public String homeStudent(Model model) {
        if (!getSessionStudent())
            return "redirect:../login/login.html";


        Student student = (Student) httpSession.getAttribute("user");
        String name = student.getName().split("\\s+")[0];
        model.addAttribute("student", student);
        model.addAttribute("name", name);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        model.addAttribute("proposals", proposalDao.getProposalsByNif(student.getNif()));
        if (registered) {
            model.addAttribute("success", "Estudiante " + student.getName() + " registrado correctamente");
            registered = false;
        }


        return "home/home_student";
    }


    private String switchUserType(Student s) {
        return s.getType() == Type.CP ? "redirect:../home/home_pc.html" :
                "redirect:../home/home_student.html";

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

    @RequestMapping("/testings/test")
    public String testWS(Model model) {
        if (!getSessionStudent())
            return "redirect:../login/login.html";
        Student student = (Student) httpSession.getAttribute("user");
        String name = student.getName().split("\\s+")[0];
        model.addAttribute("student", student);
        //TODO borra esto, es solo para la tabla
        List<Skill> list = skillDao.getSkillsCollection();
        Gson gson = new Gson();
        System.out.println(gson.toJson(list));
        model.addAttribute("skills", gson.toJson(list));
        model.addAttribute("name", name);
        model.addAttribute("type", Type.getName(student.getType().toString()));
        return "testings/test";

    }

    private String dataDegrees() {
        TreeMap<String, String> map = new TreeMap<>();
        map.put("Grado en Arquitectura Técnica", "Grado en Arquitectura Técnica");
        map.put("Grado en Diseño y Desarrollo de Videojuegos", "Grado en Diseño y Desarrollo de Videojuegos");
        map.put("Grado en Ingeniería Agroalimentaria y del Medio Rural", "Grado en Ingeniería Agroalimentaria y del Medio Rural");
        map.put("Grado en Ingeniería Eléctrica", "Grado en Ingeniería Eléctrica");
        map.put("Grado en Ingeniería en Diseño Industrial y Desarrollo de Productos", "Grado en Ingeniería en Diseño Industrial y Desarrollo de Productos");
        map.put("Grado en Ingeniería en Tecnologías Industriales", "Grado en Ingeniería en Tecnologías Industriales");
        map.put("Grado en Ingeniería Informática", "Grado en Ingeniería Informática");
        map.put("Grado en Ingeniería Mecánica", "Grado en Ingeniería Mecánica");
        map.put("Grado en Ingeniería Química", "Grado en Ingeniería Química");
        map.put("Grado en Matemática Computacional", "Grado en Matemática Computacional");
        map.put("Grado en Química", "Grado en Química");
        map.put("Grado en Enfermería", "Grado en Enfermería");
        map.put("Grado en Medicina", "Grado en Medicina");
        map.put("Grado en Psicología", "Grado en Psicología");
        map.put("Grado en Comunicación Audiovisual", "Grado en Comunicación Audiovisual");
        map.put("Grado en Estudios Ingleses", "Grado en Estudios Ingleses");
        map.put("Grado en Historia y Patrimonio", "Grado en Historia y Patrimonio");
        map.put("Grado en Historia y Patrimonio (Plan de 2015)", "Grado en Historia y Patrimonio (Plan de 2015)");
        map.put("Grado en Humanidades: Estudios Interculturales", "Grado en Humanidades: Estudios Interculturales");
        map.put("Grado en Humanidades: Estudios Interculturales (Plan de 2015)", "Grado en Humanidades: Estudios Interculturales (Plan de 2015)");
        map.put("Grado en Maestro o Maestra de Educación Infantil", "Grado en Maestro o Maestra de Educación Infantil");
        map.put("Grado en Maestro o Maestra de Educación Primaria", "Grado en Maestro o Maestra de Educación Primaria");
        map.put("Grado en Periodismo", "Grado en Periodismo");
        map.put("Grado en Publicidad y Relaciones Públicas", "Grado en Publicidad y Relaciones Públicas");
        map.put("Grado en Traducción e Interpretación", "Grado en Traducción e Interpretación");
        map.put("Grado en Administración de Empresas", "Grado en Administración de Empresas");
        map.put("Grado en Criminología y Seguridad", "Grado en Criminología y Seguridad");
        map.put("Grado en Derecho", "Grado en Derecho");
        map.put("Grado en Economía", "Grado en Economía");
        map.put("Grado en Finanzas y Contabilidad", "Grado en Finanzas y Contabilidad");
        map.put("Grado en Gestión y Administración Pública", "Grado en Gestión y Administración Pública");
        map.put("Grado en Relaciones Laborales y Recursos Humanos", "Grado en Relaciones Laborales y Recursos Humanos");
        map.put("Grado en Turismo", "Grado en Turismo");
        return new Gson().toJson(map);
    }

    private String dataMasters() {
        TreeSet<String> list = new TreeSet<>();
        list.add("Máster Universitario en Ciencia, Tecnología y Aplicaciones de los Materiales Cerámicos (Plan de 2013)");
        list.add("Máster Universitario en Diseño y Fabricación (Plan de 2015)");
        list.add("Máster Universitario en Eficiencia Energética y Sostenibilidad (Plan de 2013)");
        list.add("Máster Universitario en Física Aplicada");
        list.add("Máster Universitario en Ingeniería Industrial");
        list.add("Máster Universitario en Investigación y Biotecnología Agrarias");
        list.add("Máster Universitario en Matemática Computacional (Plan de 2013) (A distancia)");
        list.add("Máster Universitario en Matemática Computacional (Plan de 2013) (Presencial)");
        list.add("Máster Universitario en Prevención de Riesgos Laborales (Plan de 2013)");
        list.add("Máster Universitario en Protección Integrada de Cultivos (Plan de 2013)");
        list.add("Máster Universitario en Química Aplicada y Farmacológica");
        list.add("Máster Universitario en Química Sostenible (Plan de 2015)");
        list.add("Máster Universitario en Química Teórica y Modelización Computacional (Plan de 2014)");
        list.add("Máster Universitario en Sistemas Inteligentes (Plan de 2013)");
        list.add("Máster Universitario en Técnicas Cromatográficas Aplicadas (Plan de 2013)");
        list.add("Máster Universitario Erasmus Mundus en Robótica Avanzada");
        list.add("Máster Universitario Erasmus Mundus en Tecnología Geoespacial (Plan de 2013)Facultad de Ciencias Humanas y Sociales");
        list.add("Máster Universitario en Comunicación Intercultural y Enseñanza de Lenguas (Plan de 2013)");
        list.add("Master Universitario en Didáctica de la Música");
        list.add("Máster Universitario en Enseñanza y Adquisición de la Lengua Inglesa en Contextos Multilingües (Plan de 2013) (A distancia)");
        list.add("Máster Universitario en Enseñanza y Adquisición de la Lengua Inglesa en Contextos Multilingües (Plan de 2013) (Presencial)");
        list.add("Máster Universitario en Estudios Internacionales de Paz, Conflictos y Desarrollo (Plan de 2013)");
        list.add("Máster Universitario en Ética y Democracia (Plan de 2013)");
        list.add("Máster Universitario en Historia del Arte y Cultura Visual");
        list.add("Máster Universitario en Historia e Identidades en el Mediterráneo Occidental (siglos XV-XIX) (Plan de 2014)");
        list.add("Máster Universitario en Investigación Aplicada en Estudios Feministas, de Género y Ciudadanía (Plan de 2016)");
        list.add("Máster Universitario en Investigación en Traducción e Interpretación (Plan de 2013)");
        list.add("Máster Universitario en Lengua Inglesa para el Comercio Internacional");
        list.add("Máster Universitario en Nuevas Tendencias y Procesos de Innovación en Comunicación (Plan de 2016)");
        list.add("Máster Universitario en Profesor/a de Educación Secundaria Obligatoria y Bachillerato, Formación Profesional y Enseñanzas de Idiomas");
        list.add("Máster Universitario en Psicopedagogía");
        list.add("Máster Universitario en Traducción Médico-Sanitaria (Plan de 2013)");
        list.add("Máster Universitario en Abogacía");
        list.add("Máster Universitario en Cooperación al Desarrollo (Plan de 2015) (A distancia)");
        list.add("Máster Universitario en Dirección de Empresas / Master in Management");
        list.add("Máster Universitario en Economía / Master in Economics");
        list.add("Máster Universitario en Gestión de la Calidad");
        list.add("Máster Universitario en Gestión Financiera y Contabilidad Avanzada (Plan de 2013)");
        list.add("Máster Universitario en Igualdad y Género en el Ámbito Público y Privado (Plan de 2013)");
        list.add("Máster Universitario en Marketing e Investigación de Mercados");
        list.add("Máster Universitario en Sistema de Justicia Penal");
        list.add("Máster Universitario en Sostenibilidad y Responsabilidad Social Corporativa");
        list.add("Máster Universitario en Ciencias de la Enfermería (Plan de 2013)");
        list.add("Máster Universitario en Intervención y Mediación Familiar (Plan de 2014)");
        list.add("Máster Universitario en Investigación en Cerebro y Conducta");
        list.add("Máster Universitario en Psicología del Trabajo, de las Organizaciones y en Recursos Humanos (Plan de 2014) (A distancia)");
        list.add("Máster Universitario en Psicología del Trabajo, de las Organizaciones y en Recursos Humanos (Plan de 2014) (Presencial)");
        list.add("Máster Universitario en Psicología General Sanitaria");
        list.add("Máster Universitario en Rehabilitación Psicosocial en Salud Mental Comunitaria");
        return new Gson().toJson(list);

    }


}
