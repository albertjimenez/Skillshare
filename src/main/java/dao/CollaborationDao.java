package dao;

import mapper.CollaborationMapper;
import model.collaboration.Collaboration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
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


    /**
     * Designed for statistical purposes. Get number of collaborations done
     *
     * @return
     */
    public List<Collaboration> getAllCollaborations() {
        String sql = "select * from collaboration";
        return jdbcTemplate.query(sql, new CollaborationMapper());
    }

    /**
     * @param collaboration A collaboration to insert
     * @return True if it could be inserted successfully or false if not
     */
    public boolean insertCollab(Collaboration collaboration) {
        //Checking if not exists
        String existsSql = "Select * from collaboration where id_pro = ? and id_req = ?";

        try {
            jdbcTemplate.queryForObject(existsSql, new Object[]{collaboration.getIdProposal().get(),
                            collaboration.getIdRequest().get()},
                    new CollaborationMapper());
            return false;
        } catch (EmptyResultDataAccessException e) {
            String sql;
            if (collaboration.getHours() != 0) {
                sql = "insert into collaboration values (?,?,?)";
                jdbcTemplate.update(sql, new Object[]{collaboration.getIdProposal().get(),
                        collaboration.getIdRequest().get(), collaboration.getHours()});
            } else {
                sql = "insert into collaboration values (?,?)";
                jdbcTemplate.update(sql, new Object[]{collaboration.getIdProposal().get(),
                        collaboration.getIdRequest().get()});
            }

            return true;
        }

    }

    public List<Collaboration> myCollaborations(String nif) {
        String sql = "select * from collaboration where nif = ?";
        return jdbcTemplate.query(sql, new Object[]{nif}, new CollaborationMapper());

    }
}
