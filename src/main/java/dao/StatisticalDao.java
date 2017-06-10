package dao;

import mapper.CollaborationMapper;
import model.collaboration.Collaboration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 10/6/17. Project -> skillshare
 */
@Repository
public class StatisticalDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    /**
     * Designed for statistical purposes. Get number of collaborations done
     *
     * @return List<Collaboration>
     */
    public List<Collaboration> getAllCollaborations() {
        String sql = "select * from collaboration";
        return jdbcTemplate.query(sql, new CollaborationMapper());
    }
}
