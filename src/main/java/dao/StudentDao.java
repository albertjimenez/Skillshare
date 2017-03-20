package dao;

import mapper.StudentMapper;
import model.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

/**
 * Created by Beruto and Pablo Berbel on 16/3/17. Project -> skillshare
 */
@Repository
public class StudentDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public Student getStudent(String email) {
        String sql = "SELECT * FROM student where email = ?";
        Student s = jdbcTemplate.queryForObject(sql, new Object[]{email}, new StudentMapper());
        return s;
    }


}
