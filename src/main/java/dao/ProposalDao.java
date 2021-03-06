package dao;

import mapper.ProposalMapper;
import mapper.StudentMapper;
import model.Tools.Pair;
import model.proposal.Proposal;
import model.request.Request;
import model.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 17/3/17. Project -> skillshare
 */
@Repository
public class ProposalDao {

    private JdbcTemplate jdbcTemplate;
    private static final String SEQUENCE = "nextval('proposal_of_collaboration_id_seq')";
    private final static String DESCRIPTION = "Creada automáticamente";

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public List<Proposal> getProposals(String nif) {
        String sql = "SELECT * " +
                " FROM proposal_of_collaboration " + "WHERE finish_date > CURRENT_DATE AND nif != ?" +
                "except " +
                "select p.* from proposal_of_collaboration p join collaboration c on id_pro = id " +
                "ORDER BY initial_date, skill_name, skill_level";
        return jdbcTemplate.query(sql, new Object[]{nif}, new ProposalMapper());
    }

    public List<Proposal> getProposalsByNif(String nif) {
        String sql = "SELECT * FROM proposal_of_collaboration WHERE nif = ? " +
                "and finish_date > CURRENT_DATE " +
                "except " +
                "select p.* from proposal_of_collaboration p join collaboration c on id_pro = id " +
                "ORDER BY initial_date, skill_name";
        try {
            return jdbcTemplate.query(sql, new Object[]{nif}, new ProposalMapper());
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }


    public void createProposal(Proposal proposal) {
        String sql = "INSERT INTO proposal_of_collaboration VALUES(" + SEQUENCE + ",?,?,?,?,?,?" + ")";
        jdbcTemplate.update(sql, proposal.getNif(),
                proposal.getSkillName(), proposal.getLevel().toString(),
                proposal.getDescription(),
                proposal.getInitialDate(), proposal.getFinishDate());
    }


    /**
     * @param id SERIAL de la secuencia
     * @return True si lo ha borrado o false si no lo ha borrado
     */
    public boolean deleteProposal(AtomicInteger id) {
        String sql = "UPDATE proposal_of_collaboration SET finish_date = CURRENT_DATE " +
                "WHERE id = ? AND id NOT IN(SELECT id_pro FROM " +
                "collaboration)";
        try {
            jdbcTemplate.update(sql, id.get());
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

//    public boolean updateProposal(Proposal proposal) {
//
//
//        String sql = "UPDATE proposal_of_collaboration SET skill_name = ?, skill_level = ?, description = ?," +
//                "initial_date = ?, finish_date = ?";
//        try {
//            jdbcTemplate.update(sql, proposal.getSkillName(), proposal.getLevel().toString(),
//                    proposal.getDescription(), proposal.getInitialDate(), proposal.getFinishDate());
//            return true;
//        } catch (EmptyResultDataAccessException e) {
//            return false;
//        }
//    }

    public Pair<Student, Proposal> getProposalByID(AtomicInteger id) {
        Proposal p;
        String sql = "SELECT * FROM proposal_of_collaboration WHERE id = ? and finish_date > CURRENT_DATE";
        Student student;
        String sqlStudent = "SELECT * FROM student WHERE nif = ?";

        try {
            p = jdbcTemplate.queryForObject(sql, new Object[]{id.get()}, new ProposalMapper());
            student = jdbcTemplate.queryForObject(sqlStudent, new Object[]{p.getNif()}, new StudentMapper());
            student.setPassword("-");
            return new Pair<>(student, p);
        } catch (EmptyResultDataAccessException e) {
            System.out.println("Propuesta no encontrada " + id);
            return null;
        }
    }

    /**
     * @param idProposal
     * @return True if there is a single ID of the idProposal on Collaboration or false if there is not any
     */
    public boolean alreadyCollaborating(AtomicInteger idProposal) {
        String sql = "SELECT p.* FROM collaboration c JOIN proposal_of_collaboration p ON id_pro = id WHERE id = ?";
        return !jdbcTemplate.query(sql, new Object[]{idProposal.get()}, new ProposalMapper()).isEmpty();
    }

    /**
     * @param skillName A skillName
     * @return A list containing all your proposals that match with skillName
     */
    public List<Proposal> getProposalWithSkills(String skillName, String nif) {
        String sql = "SELECT * FROM proposal_of_collaboration WHERE skill_name = ? AND nif = ? " +
                "except " +
                "select p.* from proposal_of_collaboration p join collaboration c on id_pro = id " +
                "ORDER BY id";
        return jdbcTemplate.query(sql, new Object[]{skillName, nif}, new ProposalMapper());

    }

    /**
     * @param nif     Primary key for the creator of the proposal
     * @param request The request which values will be copied to an autoproposal
     */
    public void createAutoproposal(String nif, Request request) {
        String sql = "INSERT INTO proposal_of_collaboration VALUES(" + SEQUENCE + ",?,?,?,?,?,?" + ")";
        jdbcTemplate.update(sql, nif,
                request.getSkillName(), request.getLevel().toString(),
                DESCRIPTION,
                request.getInitialDate(), request.getFinishDate());
    }
}
