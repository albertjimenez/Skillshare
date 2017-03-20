package dao;

import mapper.StudentMapper;
import model.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
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


    /**
     * @param email
     * @return Null si no existe el student
     */
    public Student getStudent(String email, String password) {
        String sql = "SELECT * FROM student where email = ?";
        Student s = null;
        try {
            s = jdbcTemplate.queryForObject(sql, new Object[]{email}, new StudentMapper());
        } catch (EmptyResultDataAccessException e) {

            return s;
        }

        return s;
    }


}
