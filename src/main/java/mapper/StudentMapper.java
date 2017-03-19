package mapper;

import model.student.Student;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Beruto and Pablo Berbel on 16/3/17. Project -> skillshare
 */
public class StudentMapper implements RowMapper<Student> {

    public Student mapRow(ResultSet resultSet, int i) throws SQLException {
        Student student = new Student();

        student.setNif(resultSet.getString("nif").toUpperCase());
        student.setUsername(resultSet.getString("username"));
        student.setPassword(resultSet.getString("password"));
        student.setName(resultSet.getString("name"));
        student.setEmail(resultSet.getString("email"));
        student.setDegree(resultSet.getString("degree"));
        student.setCourse(resultSet.getInt("course"));
        return student;
    }
}
