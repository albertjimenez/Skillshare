package mapper;

import model.Tools.StatisticalElement;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Beruto and Pablo Berbel on 11/6/17. Project -> skillshare
 */
public class StatisticalMapper implements RowMapper<StatisticalElement> {
    @Override
    public StatisticalElement mapRow(ResultSet resultSet, int i) throws SQLException {
        StatisticalElement statisticalElement = new StatisticalElement();
        statisticalElement.setLabel(resultSet.getString(1));
        statisticalElement.setValue(resultSet.getInt(2));
        return statisticalElement;
    }
}
