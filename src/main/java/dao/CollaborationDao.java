package dao;

import mapper.CollaborationMapper;
import model.collaboration.Collaboration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 29/3/17. Project -> skillshare
 */
@Repository
public class CollaborationDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public List<Collaboration> getCollaborations() {
        String sql = "select * from collaboration";
        return jdbcTemplate.query(sql, new CollaborationMapper());
    }

//    TODO Select collaborations by nif: it is mandatory to join three tables
}
