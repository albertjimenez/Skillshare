package dao;

import mapper.ProposalMapper;
import model.proposal.Proposal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.ArrayList;
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
                " from proposal_of_collaboration order by initial_date, skill_name";
        return jdbcTemplate.query(sql, new ProposalMapper());
    }

    public List<Proposal> getProposalsByNif(String nif) {
        String sql = "select * from proposal_of_collaboration where nif = ? order by initial_date, skill_name";
        try {
            return jdbcTemplate.query(sql, new Object[]{nif}, new ProposalMapper());
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<Proposal>();
        }
    }

    public List<Proposal> getProposalsBySkillName(String skillName) {
        final String likeSkillName = '%' + skillName + '%';
        String sql = "select * from proposal_of_collaboration where skill_name like " + likeSkillName + " order by initial_date, skill_name";
        try {
            return jdbcTemplate.query(sql, new Object[]{skillName}, new ProposalMapper());
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<Proposal>();
        }
    }
}
