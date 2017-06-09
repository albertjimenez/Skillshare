package mapper;

import model.Tools.Pair;
import model.collaboration.Collaboration;
import model.proposal.Proposal;
import model.skill.Level;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 9/6/17. Project -> skillshare
 */
public class CollaborationProposalMapper implements RowMapper<Pair<Collaboration, Proposal>> {

    @Override
    public Pair<Collaboration, Proposal> mapRow(ResultSet resultSet, int i) throws SQLException {
        //Objects
        Collaboration collaboration = new Collaboration();
        Proposal proposal = new Proposal();

        //Proposal setters
        proposal.setId(new AtomicInteger(resultSet.getInt("id")));
        proposal.setNif(resultSet.getString("nif"));
        proposal.setSkillName(resultSet.getString("skill_name"));
        proposal.setLevel(Level.getEnum(resultSet.getString("skill_level")));
        proposal.setDescription(resultSet.getString("description"));
        proposal.setInitialDate(resultSet.getDate("initial_date"));
        proposal.setFinishDate(resultSet.getDate("finish_date"));


        //Collaboration setters
        collaboration.setIdProposal(new AtomicInteger(resultSet.getInt("id_pro")));
        collaboration.setIdRequest(new AtomicInteger(resultSet.getInt("id_req")));
        collaboration.setHours(resultSet.getInt("hours"));
        collaboration.setRating(resultSet.getInt("rating"));


        return new Pair<>(collaboration, proposal);
    }
}
