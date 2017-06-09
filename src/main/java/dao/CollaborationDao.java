package dao;

import mapper.CollaborationMapper;
import mapper.CollaborationProposalMapper;
import mapper.CollaborationRequestMapper;
import model.Tools.Pair;
import model.collaboration.Collaboration;
import model.proposal.Proposal;
import model.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 29/3/17. Project -> skillshare
 */

@Repository
public class CollaborationDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    /**
     * Designed for statistical purposes. Get number of collaborations done
     *
     * @return
     */
    public List<Collaboration> getAllCollaborations() {
        String sql = "select * from collaboration";
        return jdbcTemplate.query(sql, new CollaborationMapper());
    }

    /**
     * @param idProposal
     * @param idRequest
     * @return If there is any, it returns the collaboration that matches the proper ids.
     */
    public Collaboration getCollaborationByIDs(AtomicInteger idProposal, AtomicInteger idRequest) {
        String sql = "Select * from collaboration where id_pro = ? and id_req = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{idProposal.get(), idRequest.get()},
                new CollaborationMapper());
    }

    public void rateCollaboration(Collaboration collaboration) {
        String sql = "update collaboration set rating = ? where id_pro = ? and id_req = ?";
        jdbcTemplate.update(sql, collaboration.getRating(), collaboration.getIdProposal().get(),
                collaboration.getIdRequest().get());
    }

    /**
     * @param collaboration A collaboration to insert
     * @return True if it could be inserted successfully or false if not
     */
    public boolean insertCollab(Collaboration collaboration) {
        //Checking if not exists
        String existsSql = "Select * from collaboration where id_pro = ? and id_req = ?";

        try {
            jdbcTemplate.queryForObject(existsSql, new Object[]{collaboration.getIdProposal().get(),
                            collaboration.getIdRequest().get()},
                    new CollaborationMapper());
            return false;
        } catch (EmptyResultDataAccessException e) {
            String sql;
            if (collaboration.getHours() != 0) {
                sql = "insert into collaboration values (?,?,?)";
                jdbcTemplate.update(sql, new Object[]{collaboration.getIdProposal().get(),
                        collaboration.getIdRequest().get(), collaboration.getHours()});
            } else {
                sql = "insert into collaboration values (?,?)";
                jdbcTemplate.update(sql, new Object[]{collaboration.getIdProposal().get(),
                        collaboration.getIdRequest().get()});
            }

            return true;
        }

    }

    public List<Pair<Collaboration, Proposal>> myCollaborationsFromProposal(String nif) {


        final String sqlAll = "select * from proposal_of_collaboration p join collaboration c " +
                "on id = id_pro" +
                " where nif = ? ORDER BY initial_date DESC ";


        return jdbcTemplate.query(sqlAll, new Object[]{nif}, new CollaborationProposalMapper());

    }

    public List<Pair<Collaboration, Request>> myCollaborationsFromRequest(String nif) {
        final String sqlAll = "select * from request_of_collaboration r join collaboration c " +
                "on id = id_req" +
                " where nif = ? ORDER BY initial_date DESC ";
        return jdbcTemplate.query(sqlAll, new Object[]{nif}, new CollaborationRequestMapper());

    }

    /**
     * @param nif
     * @return The number of hours given minus received. It can be negative
     */
    public int getHours(String nif) {
        final String sql = "select sum(hours) as num_hours from request_of_collaboration p join collaboration c on id= id_req\n" +
                "where nif = ?";
        Integer numHoursRequest = jdbcTemplate.queryForInt(sql, nif);

        final String sql2 = "select sum(hours) as num_hours from proposal_of_collaboration p join collaboration c on id= id_pro\n" +
                "where nif = ?";
        Integer numHoursProposal = jdbcTemplate.queryForInt(sql2, nif);
        return numHoursProposal - numHoursRequest;
    }

}
