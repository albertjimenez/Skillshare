package dao;

import mapper.StudentMapper;
import model.student.ErrorCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 20/3/17. Project -> skillshare
 */
@Repository
public class BannedDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public boolean isBanned(String nif) {

        String sql = "select nif from banned where nif = ?";
        try {
            jdbcTemplate.queryForObject(sql, new Object[]{nif}, String.class);
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }

    }

    public List<String> getBanneds() {
        String sql = "select nif from banned ORDER BY nif";
        try {
            return jdbcTemplate.query(sql, new RowMapper<String>() {
                public String mapRow(ResultSet resultSet, int i) throws SQLException {
                    return resultSet.getString("nif");
                }
            });
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<String>();
        }
    }

    public boolean deleteBanned(String nif) {
        String sql = "DELETE FROM BANNED WHERE NIF = ?";
        try {
            jdbcTemplate.update(sql, nif);
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

    public ErrorCode ban(String nif) {
        final String insert = "INSERT INTO BANNED VALUES(?)";
        final String sql = "select nif from banned where nif = ?";
        final String checkStudent = "select nif from student where nif = ?";
        try {
            jdbcTemplate.queryForObject(sql, new Object[]{nif}, String.class);
            return ErrorCode.ALREADY_BANNED;
        } catch (EmptyResultDataAccessException e) {

            try {
                jdbcTemplate.queryForObject(checkStudent, new Object[]{nif}, new StudentMapper());
                jdbcTemplate.update(insert, nif);
                return ErrorCode.BANNED;
            } catch (EmptyResultDataAccessException e1) {
                System.out.println("No existe el estudiante " + nif);
                return ErrorCode.NOT_EXISTS;
            }

        }
    }
}
