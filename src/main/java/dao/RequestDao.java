package dao;

import mapper.RequestMapper;
import mapper.StudentMapper;
import model.Tools.Pair;
import model.proposal.Proposal;
import model.request.Request;
import model.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 29/3/17. Project -> skillshare
 */
public class RequestDao {
    private JdbcTemplate jdbcTemplate;
    private final String SEQUENCE = "nextval('request_of_collaboration_id_seq')";
    private final static String DESCRIPTION = "Creada automáticamente";

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public List<Request> getRequests(String nif) {
        String sql = "select * from request_of_collaboration WHERE finish_date > CURRENT_DATE AND nif != ?" +
                " EXCEPT select r.* from request_of_collaboration r JOIN collaboration c ON id_req = id " +
                "order by initial_date, skill_name, skill_level";
        return jdbcTemplate.query(sql, new Object[]{nif}, new RequestMapper());
    }

    public List<Request> getRequestsByNif(String nif) {
        String sql = "select * from request_of_collaboration  where nif = ? AND finish_date > CURRENT_DATE " +
                " EXCEPT select r.* from request_of_collaboration r JOIN collaboration c ON id_req = id " +
                "order by initial_date, skill_name";
        try {
            return jdbcTemplate.query(sql, new Object[]{nif}, new RequestMapper());
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

    public void createRequest(Request request) {
        String sql = "INSERT INTO request_of_collaboration VALUES(" + SEQUENCE + ",?,?,?,?,?,?" + ")";
        jdbcTemplate.update(sql, request.getNif(),
                request.getSkillName(), request.getLevel().toString(),
                request.getDescription(),
                request.getInitialDate(), request.getFinishDate());
    }

    /**
     * @param idRequest
     * @return True if there is a single ID of the idRequest on Collaboration or false if there is not any
     */
    public boolean alreadyCollaborating(AtomicInteger idRequest) {
        String sql = "select r.* from collaboration c join request_of_collaboration r on id_req = id where id = ?";
        return !jdbcTemplate.query(sql, new Object[]{idRequest.get()}, new RequestMapper()).isEmpty();
    }

    public Pair<Student, Request> getRequestByID(AtomicInteger id) {
        Request p;
        String sql = "SELECT * FROM request_of_collaboration WHERE id = ? and finish_date > CURRENT_DATE";
        Student student;
        String sqlStudent = "SELECT * FROM student WHERE nif = ?";

        try {
            p = jdbcTemplate.queryForObject(sql, new Object[]{id.get()}, new RequestMapper());
            student = jdbcTemplate.queryForObject(sqlStudent, new Object[]{p.getNif()}, new StudentMapper());
            student.setPassword("-");
            return new Pair<>(student, p);
        } catch (EmptyResultDataAccessException e) {
            System.out.println("Solicitud no encontrada " + id);
            return null;
        }


    }

    /**
     * @param skillName A skillName
     * @return A list containing all your request that match with skillName
     */
    public List<Request> getRequestWithSkills(String skillName, String nif) {
        String sql = "SELECT * FROM request_of_collaboration WHERE skill_name = ? AND nif = ?"
                + " EXCEPT select r.* from request_of_collaboration r JOIN collaboration c ON id_req = id ";
        return jdbcTemplate.query(sql, new Object[]{skillName, nif}, new RequestMapper());

    }

    /**
     * @param nif      Primary key for the creator of the request
     * @param proposal The proposal which values will be copied to an autorequest
     */
    public void createAutorequest(String nif, Proposal proposal) {
        String sql = "INSERT INTO request_of_collaboration VALUES(" + SEQUENCE + ",?,?,?,?,?,?" + ")";
        jdbcTemplate.update(sql, nif,
                proposal.getSkillName(), proposal.getLevel().toString(),
                DESCRIPTION,
                proposal.getInitialDate(), proposal.getFinishDate());
    }

    /**
     * @param id SERIAL de la secuencia
     * @return True si lo ha borrado o false si no lo ha borrado
     */
    public boolean deleteRequest(AtomicInteger id) {
        String sql = "UPDATE request_of_collaboration SET finish_date = CURRENT_DATE " +
                "where id = ? and id not in(select id_req from " +
                "collaboration)";
        try {
            jdbcTemplate.update(sql, id.get());
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

}
