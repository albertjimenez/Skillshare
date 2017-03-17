package mapper;

import model.skill.Level;
import model.skill.Skill;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Beruto and Pablo Berbel on 15/3/17. Project -> skillshare
 */
public class SkillMapper implements RowMapper<Skill> {

    public Skill mapRow(ResultSet resultSet, int i) throws SQLException {
        Skill skill = new Skill();
        skill.setName(resultSet.getString("name").toLowerCase());
        skill.setDescription(resultSet.getString("description").toLowerCase());
        skill.setLevel(Level.getEnum(resultSet.getString("level")));
        return skill;
    }
}
