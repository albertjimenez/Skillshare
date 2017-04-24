package websocket;

import java.util.Date;

/**
 * Created by Beruto and Pablo Berbel on 24/4/17. Project -> skillshare
 */
public class MensajesWS {

    private String texto;
    //Son el correo
    private String destinatario;
    private String emisor;
    private Date fecha;

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getEmisor() {
        return emisor;
    }

    public void setEmisor(String emisor) {
        this.emisor = emisor;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
