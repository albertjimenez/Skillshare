package dao;

import mapper.StatisticalMapper;
import model.Tools.StatisticalElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
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


    public Integer pendingProposals() {
        String sql = "Select id\n" +
                "from proposal_of_collaboration\n" +
                "except\n" +
                "Select distinct id_pro\n" +
                "from collaboration";
        return jdbcTemplate.query(sql, new StatisticIntegerResult()).size();
    }

    public Integer pendingRequests() {
        String sql = "Select id\n" +
                "from request_of_collaboration\n" +
                "except\n" +
                "Select distinct id_req\n" +
                "from collaboration";
        return jdbcTemplate.query(sql, new StatisticIntegerResult()).size();
    }

    public Integer collaborationsOnProposals() {
        final String sqlAll = "select * from proposal_of_collaboration p join collaboration c " +
                "on id = id_pro";
        return jdbcTemplate.query(sqlAll, new StatisticIntegerResult()).size();
    }

    public Integer collaborationsOnRequests() {
        final String sqlAll = "select * from request_of_collaboration p join collaboration c " +
                "on id = id_req";
        return jdbcTemplate.query(sqlAll, new StatisticIntegerResult()).size();
    }

    public List<StatisticalElement> demandedSkills() {
        String sql = "Select s.name, count(s.name) as num_collab\n" +
                "from skill s " +
                "where s.name  in (Select sk.name\n" +
                "from skill sk join proposal_of_collaboration p on name = skill_name join collaboration c on id = id_pro\n" +
                "where s.name = sk.name)\n" +
                "group by s.name";
        return jdbcTemplate.query(sql, new StatisticalMapper());
    }

    public List<StatisticalElement> degreesMoreCollaborative() {
        String sql = "Select distinct s.degree, count(id) as num_collab\n" +
                "from student s join request_of_collaboration p1 using(nif)\n" +
                "where s.degree  in (Select st.degree\n" +
                "\t\t\t from student st join request_of_collaboration p using(nif) join collaboration c on id = id_req\n" +
                "\t\t\t where s.degree = st.degree)\n" +
                "group by s.degree;";
        return jdbcTemplate.query(sql, new StatisticalMapper());
    }

//    public Integer hoursOnProposal(){
//        final String sql = "select sum(hours) as num_hours from proposal_of_collaboration p join collaboration c on id= id_pro";
//        return jdbcTemplate.queryForInt(sql);
//    }
//
//    public Integer hoursOnRequest(){
//        String sql = "select sum(hours) as num_hours from request_of_collaboration p join collaboration c on id= id_req";
//        return jdbcTemplate.queryForInt(sql);
//    }
}

class StatisticIntegerResult implements RowMapper<Integer> {
    @Override
    public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
        return resultSet.getInt(1);
    }
}
