package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

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
}
