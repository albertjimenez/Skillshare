package dao;

import mapper.SkillMapper;
import model.skill.Level;
import model.skill.Skill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

/**
 * Created by Beruto and Pablo Berbel on 15/3/17. Project -> skillshare
 */

@Repository
public class SkillDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Skill> getSkillsCollection() {
        String sql = "select name, level, description from skill";
        String anSQL = "select id, nif , skill_name , skill_level , description  , initial_date , finish_date " +
                " from proposal_of_collaboration";

        return jdbcTemplate.query(sql, new SkillMapper());
    }

    public List<Skill> getSkillsByName(String name) {
        String sql = "select name, level, description from skill where name = ?";
        return jdbcTemplate.query(sql, new Object[]{name}, new SkillMapper());
    }


    public Skill findSkill(String name, Level level) {
        String sql = "select name, level, description from skill where name = ? and skill = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{name, level}, new SkillMapper());

    }


}
