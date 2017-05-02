package controller;

import dao.CollaborationDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Beruto and Pablo Berbel on 1/5/17. Project -> skillshare
 */

@Controller
public class CollaborationController {


    private CollaborationDao collaborationDao;

    @Autowired
    public void setCollaborationDao(CollaborationDao collaborationDao) {
        this.collaborationDao = collaborationDao;
    }


}
