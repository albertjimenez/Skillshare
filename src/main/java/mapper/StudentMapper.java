package mapper;

import model.student.RegularStudent;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Beruto and Pablo Berbel on 16/3/17. Project -> skillshare
 */
public class StudentMapper implements RowMapper<RegularStudent> {

    public RegularStudent mapRow(ResultSet resultSet, int i) throws SQLException {
        RegularStudent regularStudent = new RegularStudent();

        regularStudent.setNif(resultSet.getString("nif").toUpperCase());
        regularStudent.setUsername(resultSet.getString("username"));
        regularStudent.setPassword(resultSet.getString("password"));
        regularStudent.setName(resultSet.getString("name"));
        regularStudent.setEmail(resultSet.getString("email"));
        regularStudent.setDegree(resultSet.getString("degree"));
        regularStudent.setCourse(resultSet.getInt("course"));
        return regularStudent;
    }
}
