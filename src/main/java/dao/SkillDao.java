package dao;

import mapper.SkillMapper;
import model.skill.Level;
import model.skill.Skill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
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
        return jdbcTemplate.query(sql, new SkillMapper());
    }


    public Skill findSkill(String name, Level level) {
        String sql = "select name, level, description from skill where name = ? and level = ?";

        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{name, level.toString()}, new SkillMapper());
        } catch (EmptyResultDataAccessException e) {
            return new Skill();
        }

    }

    public List<Skill> findSkillByName(String name) {
        String sql = "select * from skill where name = ?";
        return jdbcTemplate.query(sql, new Object[]{name}, new SkillMapper());
    }

    public void editSkill(Skill skill) {
        String sql = "UPDATE Skill set description=? where name=? and level=?";
        try {

            jdbcTemplate.update(sql, skill.getDescription(), skill.getName(), skill.getLevel().toString());
        } catch (EmptyResultDataAccessException e) {
            System.out.println("No encuentro esa habilidad");
        }
    }

    /**
     * @param skill
     * @return False si ya existia la skill, true si no estaba antes
     */
    public boolean addSkill(Skill skill) {
        String sqlQuery = "SELECT * from Skill where name = ? and level = ?";
        String sql = "INSERT INTO SKILL VALUES(?,?,?)";
        try {
            jdbcTemplate.queryForObject(sqlQuery,
                    new Object[]{skill.getName(), skill.getLevel().toString()}, new SkillMapper());
            System.out.println("sí esta");
            return false;
        } catch (EmptyResultDataAccessException e) {
            System.out.println("no esta");
            jdbcTemplate.update(sql, skill.getName(),
                    skill.getLevel().toString(), skill.getDescription());
            return true;
        }
    }

    public void removeSkill(Skill skill) {

        String sql = "DELETE from Skill where name = ? and level = ?";
        jdbcTemplate.update(sql, skill.getName(), skill.getLevel().toString());

    }


}
