package websocket;

import java.io.Serializable;

/**
 * Created by Beruto and Pablo Berbel on 24/4/17. Project -> skillshare
 */
public class MensajesWS implements Serializable {

    //Son el correo
    private String nif;
    private int idProp;
    private int idReq;
    private boolean isProposalURL;

    public boolean isProposalURL() {
        return isProposalURL;
    }

    public void setProposalURL(boolean proposalURL) {
        isProposalURL = proposalURL;
    }

    public int getIdReq() {
        return idReq;
    }

    public void setIdReq(int idReq) {
        this.idReq = idReq;
    }

    public Integer getIdProp() {
        return idProp;
    }

    public void setIdProp(int idProp) {
        this.idProp = idProp;
    }

    public String getNif() {
        return nif;
    }

    public void setNif(String nif) {
        this.nif = nif;
    }

    @Override
    public String toString() {
        return "MensajesWS{" +
                "nif='" + nif + '\'' +
                ", idProp=" + idProp +
                ", idReq=" + idReq +
                ", isProposalURL=" + isProposalURL +
                '}';
    }
}
