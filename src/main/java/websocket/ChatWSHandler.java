package websocket;

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

    private static ConcurrentHashMap<String, Session> activeSessions = new ConcurrentHashMap<>();


    public void registerSession(String nif, Session session) {
        activeSessions.put(nif, session);
        System.out.println(activeSessions);
    }

    public static void unregister(String email) {
        activeSessions.remove(email);
    }

    public static void handleMessage(MensajesWS mensajesWS) {
        JsonProvider jsonProvider = JsonProvider.provider();
        JsonObject jsonObject = jsonProvider.createObjectBuilder().
                add("nif", mensajesWS.getNif()).
                add("idProp", mensajesWS.getIdProp()).
                add("idReq", mensajesWS.getIdReq()).
                add("isProposalURL", mensajesWS.isProposalURL()).
                build();

        sendMessage(mensajesWS.getNif(), jsonObject.toString());
    }

    public static void sendMessage(String nif, String message) {


        Session session = activeSessions.get(nif);
        System.out.println("Lo que envio del server " + message);

        if (session == null)
            return;
        try {
            session.getBasicRemote().sendText(message);
            System.out.println("mi mensaje que envio del server:->" + message);
        } catch (IOException e) {
            Logger.getAnonymousLogger().info(e.getMessage());
            unregister(nif);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
    }

}
