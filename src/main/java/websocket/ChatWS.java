package websocket;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.StringReader;

/**
 * Created by Beruto and Pablo Berbel on 24/4/17. Project -> skillshare
 */

//Mi correo en la colaboracion SOLO
@ServerEndpoint("/notification/{nif}")
public class ChatWS {

    static ChatWSHandler chatWSHandler = new ChatWSHandler();
    private JsonReader jsonReader;


    @OnOpen
    public void open(@PathParam("nif") String nif, Session session) {
        //Poll for keeping alive
//        new Timer().schedule(new TimerWS(session),0L,10000L);
        System.out.println("Estoy abierto como el minas: Nif " + nif);
        chatWSHandler.registerSession(nif, session);
        System.out.println(session.isOpen());

    }

    @OnClose
    public void close(@PathParam("nif") String nif) {
        chatWSHandler.unregister(nif);
        System.out.println("Me he chapado");
    }

    @OnMessage
    public void message(String message) {
        System.out.println("mensaje recibido de WS->" + message);
        jsonReader = Json.createReader(new StringReader(message));
        JsonObject jsonMessage = jsonReader.readObject();
        MensajesWS mensajesWS = new MensajesWS();
        mensajesWS.setNif(jsonMessage.getString("nif"));
        mensajesWS.setIdProp(jsonMessage.getInt("idProp"));
        mensajesWS.setIdReq(jsonMessage.getInt("idReq"));
        mensajesWS.setProposalURL(jsonMessage.getBoolean("isProposalURL"));
        System.out.println(mensajesWS);
        chatWSHandler.handleMessage(mensajesWS);
    }

    @OnError
    public void error(Session session, Throwable throwable) {
        System.out.println("Error de mensajes");
        System.out.println(throwable.getMessage());
    }
}

