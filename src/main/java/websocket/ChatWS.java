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
@ServerEndpoint("/chat/{myemail}")
public class ChatWS {

    static ChatWSHandler chatWSHandler = new ChatWSHandler();
    private JsonReader jsonReader;


    @OnOpen
    public void open(@PathParam("myemail") String myemail, Session session) {
        System.out.println("Estoy abierto como el minas");
        chatWSHandler.registerSession(myemail, session);

    }

    @OnClose
    public void close(@PathParam("myemail") String myemail) {
        chatWSHandler.unregister(myemail);
        System.out.println("Me he chapado");
    }

    @OnMessage
    public void message(String message) {
        jsonReader = Json.createReader(new StringReader(message));
        JsonObject jsonMessage = jsonReader.readObject();
        //TODO construir mensaje a base de atributos
        MensajesWS mensajesWS = null;
//        jsonMessage.getString("texto");
        //Mirar http://stackoverflow.com/questions/15761101/how-to-get-a-date-from-a-json-object

        chatWSHandler.handleMessage(mensajesWS);
    }

    @OnError
    public void error(Session session, Throwable throwable) {
        System.out.println("Error de mensajes");
        System.out.println(throwable.getMessage());
    }
}

