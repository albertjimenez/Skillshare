package model.collaboration;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by PabloBerbel on 28/03/2017.
 */
public class Collaboration {
    private AtomicInteger idProposal, idRequest;
    private int hours, rating;

    public AtomicInteger getIdProposal() {
        return idProposal;
    }

    public void setIdProposal(AtomicInteger idProposal) {
        this.idProposal = idProposal;
    }

    public AtomicInteger getIdRequest() {
        return idRequest;
    }

    public void setIdRequest(AtomicInteger idRequest) {
        this.idRequest = idRequest;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Collaboration) {
            Collaboration anotherCollaboration = (Collaboration) obj;
            return this.idProposal.equals(anotherCollaboration.idProposal) &&
                    this.idRequest.equals(anotherCollaboration.idRequest);
        }
        return false;
    }

    @Override
    public String toString() {
        return "Collaboration{" +
                "idProposal=" + idProposal +
                ", idRequest=" + idRequest +
                ", hours=" + hours +
                ", rating=" + rating +
                '}';
    }
}
