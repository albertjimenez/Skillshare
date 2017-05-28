package dao;

import mapper.CollaborationMapper;
import model.collaboration.Collaboration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

/**
 * Created by Beruto and Pablo Berbel on 29/3/17. Project -> skillshare
 */

//TODO Pendiente de hablar con Vervhel
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
    public Integer getCollaborationsNumber() {
        String sql = "select * from " + Collaboration.TABLE_COLLAB_PROP;
        Integer num = 0;
        try {
            num += jdbcTemplate.query(sql, new CollaborationMapper()).size();
        } catch (EmptyResultDataAccessException e) {
            System.out.println("No hay Colaboraciones de propuesta");
        }
        String sql2 = "select * from " + Collaboration.TABLE_COLLAB_REQ;
        try {
            num += jdbcTemplate.query(sql2, new CollaborationMapper()).size();
        } catch (EmptyResultDataAccessException e) {
            System.out.println("No hay Colaboraciones de petición");
        }

        return num;
    }

//    public List<Collaboration> myCollaborations(String nif){
//
//    }
}
