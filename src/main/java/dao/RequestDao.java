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


//    public List<Request> getRequests() {
//        String sql = "select * from request_of_collaboration order by initial_date, skill_name";
//        return jdbcTemplate.query(sql, new RequestMapper());
//    }

    public List<Request> getRequestsByNif(String nif) {
        String sql = "select * from request_of_collaboration where nif = ? AND finish_date > CURRENT_DATE order by initial_date, skill_name";
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

    public Pair<Student, Request> getRequestsByID(AtomicInteger id) {
        Request p;
        String sql = "SELECT * FROM request_of_collaboration WHERE id = ? and finish_date > CURRENT_DATE";
        Student student;
        String sqlStudent = "SELECT * FROM student WHERE nif = ?";

        try {
            p = jdbcTemplate.queryForObject(sql, new Object[]{id.get()}, new RequestMapper());
            student = jdbcTemplate.queryForObject(sqlStudent, new Object[]{p.getNif()}, new StudentMapper());
            student.setPassword("-");
            student.setNif("-");
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
        String sql = "SELECT * FROM request_of_collaboration WHERE skill_name = ? AND nif = ?";
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

}
