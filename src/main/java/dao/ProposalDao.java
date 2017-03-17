package dao;

import mapper.ProposalMapper;
import model.proposal.Proposal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 17/3/17. Project -> skillshare
 */
@Repository
public class ProposalDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public List<Proposal> getProposals() {
        String sql = "select id , nif , skill_name , skill_level , description  , initial_date , finish_date " +
                " from proposal_of_collaboration";
        return jdbcTemplate.query(sql, new ProposalMapper());
    }
}
