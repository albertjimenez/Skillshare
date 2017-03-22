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
     * @param account  Puede ser tanto; email como el username
     * @param password Contraseña
     * @return Null si no existe el student, {@link Student} vacio si la contraseña es incorrecta y {@link Student} con cosas si es correcta
     * si el nif del usuario está BANEADO entonces el campo nif tendrá como valor BANEADO
     */
    public Student getStudent(String account, String password) {

        String sqlEmail = "", sqlUsername = "";
        Student s = null;
        if (account.toLowerCase().contains("@")) sqlEmail = "SELECT * FROM student where account = ?";
        else sqlUsername = "SELECT * FROM student where username = ?";
        try {
            if (!sqlEmail.equals(""))
                s = jdbcTemplate.queryForObject(sqlEmail.toLowerCase(), new Object[]{account}, new StudentMapper());
            else
                s = jdbcTemplate.queryForObject(sqlUsername.toLowerCase(), new Object[]{account}, new StudentMapper());
        } catch (EmptyResultDataAccessException e) {

            return s;
        }
        String sql = "Select * from banned where nif = ?";
        String banned = null;
        try {
            banned = jdbcTemplate.queryForObject(sql, new Object[]{s.getNif().toUpperCase()}, String.class);
        } catch (EmptyResultDataAccessException e) {

            return s.getPassword().equals(password) ? s : new Student();

        }
        //Si llegas hasta aqui es que el usuario está baneado
        s.setNif("BANEADO");
        return s.getPassword().equals(password) ? s : new Student();
    }


}
