package model.Tools;

import javax.websocket.Session;
import java.io.IOException;
import java.util.TimerTask;
import java.util.logging.Logger;

/**
 * Created by Beruto and Pablo Berbel on 12/6/17. Project -> skillshare
 */
public class TimerWS extends TimerTask {

    private Session session;

    public TimerWS(Session session) {
        this.session = session;
    }

    @Override
    public void run() {
        try {
            session.getBasicRemote().sendText("open");
        } catch (IOException | NullPointerException e2) {
            Logger.getAnonymousLogger().info(e2.getMessage());
        }
    }
}
