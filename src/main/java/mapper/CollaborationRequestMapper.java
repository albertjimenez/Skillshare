package mapper;

import model.Tools.Pair;
import model.collaboration.Collaboration;
import model.request.Request;
import model.skill.Level;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 9/6/17. Project -> skillshare
 */
public class CollaborationRequestMapper implements RowMapper<Pair<Collaboration, Request>> {

    @Override
    public Pair<Collaboration, Request> mapRow(ResultSet resultSet, int i) throws SQLException {
        //Objects
        Collaboration collaboration = new Collaboration();
        Request request = new Request();

        //Proposal setters
        request.setId(new AtomicInteger(resultSet.getInt("id")));
        request.setNif(resultSet.getString("nif"));
        request.setSkillName(resultSet.getString("skill_name"));
        request.setLevel(Level.getEnum(resultSet.getString("skill_level")));
        request.setDescription(resultSet.getString("description"));
        request.setInitialDate(resultSet.getDate("initial_date"));
        request.setFinishDate(resultSet.getDate("finish_date"));


        //Collaboration setters
        collaboration.setIdProposal(new AtomicInteger(resultSet.getInt("id_pro")));
        collaboration.setIdRequest(new AtomicInteger(resultSet.getInt("id_req")));
        collaboration.setHours(resultSet.getInt("hours"));
        collaboration.setRating(resultSet.getInt("rating"));


        return new Pair<>(collaboration, request);
    }
}
