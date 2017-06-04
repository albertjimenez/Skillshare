package mapper;

import model.collaboration.Collaboration;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and PabloBerbel on 29/03/2017.
 */
public class CollaborationMapper implements RowMapper<Collaboration> {
    public Collaboration mapRow(ResultSet resultSet, int i) throws SQLException {
        Collaboration collab = new Collaboration();
        collab.setIdProposal(new AtomicInteger(resultSet.getInt("id_pro")));
        collab.setIdRequest(new AtomicInteger(resultSet.getInt("id_req")));
        collab.setHours(resultSet.getInt("hours"));
        collab.setRating(resultSet.getInt("rating")); // Rating can be null

        return collab;
    }
}
