package mapper;

import model.request.Request;
import model.skill.Level;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 28/3/17. Project -> skillshare
 */
public class RequestMapper implements RowMapper<Request> {
    public Request mapRow(ResultSet resultSet, int i) throws SQLException {
        Request request = new Request();
        request.setId(new AtomicInteger(resultSet.getInt("id")));
        request.setNif(resultSet.getString("nif"));
        request.setSkillName(resultSet.getString("skill_name"));
        request.setLevel(Level.getEnum(resultSet.getString("skill_level")));
        request.setDescription(resultSet.getString("description"));
        request.setInitialDate(resultSet.getDate("initial_date"));
        request.setFinishDate(resultSet.getDate("finish_date"));
        request.setSeen(resultSet.getBoolean("seen"));

        return request;
    }
}
