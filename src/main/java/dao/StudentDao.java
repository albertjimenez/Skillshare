package dao;

import mapper.SkillMapper;
import model.student.RegularStudent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;

/**
 * Created by Beruto and Pablo Berbel on 16/3/17. Project -> skillshare
 */
@Repository
@RequestMapping("/testing")
public class StudentDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    //TODO DO THE FORM
    //@RequestMapping(value = "/listProposals{nif}" )
    public String getProposalsByStudent(String nif){
        String sql = "SELECT * FROM proposal_of_collaboration where nif = ?";
        System.out.println(jdbcTemplate.query(sql, new Object[]{nif}, new SkillMapper()));
        return "testing/listProposals";
    }


}
