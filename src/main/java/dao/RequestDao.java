package dao;

import mapper.RequestMapper;
import model.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 29/3/17. Project -> skillshare
 */
public class RequestDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


//    public List<Request> getRequests() {
//        String sql = "select * from request_of_collaboration order by initial_date, skill_name";
//        return jdbcTemplate.query(sql, new RequestMapper());
//    }

    public List<Request> getRequestsByNif(String nif) {
        String sql = "select * from request_of_collaboration where nif = ? order by initial_date, skill_name";
        try {
            return jdbcTemplate.query(sql, new Object[]{nif}, new RequestMapper());
        } catch (EmptyResultDataAccessException e) {
            return new ArrayList<>();
        }
    }

}
