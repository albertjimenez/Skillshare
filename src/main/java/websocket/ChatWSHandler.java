package websocket;

import dao.MensajesDao;

import javax.json.JsonObject;
import javax.json.spi.JsonProvider;
import javax.websocket.Session;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Logger;

/**
 * Created by Beruto and Pablo Berbel on 24/4/17. Project -> skillshare
 */
public class ChatWSHandler {

    private ConcurrentHashMap<String, Session> activeSessions;

    private MensajesDao mensajesDao = new MensajesDao();


    public ChatWSHandler() {
        activeSessions = new ConcurrentHashMap<>();
    }

    public void registerSession(String email, Session session) {
        activeSessions.put(email, session);
    }

    public void unregister(String email) {
        activeSessions.remove(email);
    }

    public void handleMessage(MensajesWS mensajesWS) {
        mensajesDao.addMensaje(mensajesWS);

        JsonProvider jsonProvider = JsonProvider.provider();
        JsonObject jsonObject = jsonProvider.createObjectBuilder().
                add("texto", mensajesWS.getTexto()).
                add("destintario", mensajesWS.getDestinatario()).
                add("emisor", mensajesWS.getEmisor()).
                add("fecha", mensajesWS.getFecha().toString()).build();

        sendMessage(mensajesWS.getEmisor(), jsonObject.toString());
        sendMessage(mensajesWS.getDestinatario(), jsonObject.toString());
    }

    private void sendMessage(String email, String message) {
        Session session = activeSessions.get(email);

        if (session == null)
            return;

        try {
            session.getBasicRemote().sendText(message);

        } catch (IOException e) {
            Logger.getAnonymousLogger().info(e.getMessage());
            unregister(email);
        }
    }

}
