package mapper;

import model.proposal.Proposal;
import model.skill.Level;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 17/3/17. Project -> skillshare
 */
public class ProposalMapper implements RowMapper<Proposal> {

    public Proposal mapRow(ResultSet resultSet, int i) throws SQLException {
        Proposal proposal = new Proposal();
        proposal.setId(new AtomicInteger(resultSet.getInt("id")));
        proposal.setNif(resultSet.getString("nif"));
        proposal.setSkillName(resultSet.getString("skill_name"));
        proposal.setLevel(Level.getEnum(resultSet.getString("skill_level")));
        proposal.setDescription(resultSet.getString("description"));
        proposal.setInitialDate(resultSet.getDate("initial_date"));
        proposal.setFinishDate(resultSet.getDate("finish_date"));

        return proposal;
    }
}
