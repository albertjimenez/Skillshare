package model.collaboration;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by PabloBerbel on 28/03/2017.
 */
public class Collaboration {
    private static final Integer DEFAULT_HOURS = 2;


    private AtomicInteger idProposal, idRequest;
    private int hours, rating;


    public AtomicInteger getIdProposal() {
        return idProposal;
    }

    public void setIdProposal(AtomicInteger idProposal) {
        this.idProposal = idProposal;
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

    public AtomicInteger getIdRequest() {
        return idRequest;
    }

    public void setIdRequest(AtomicInteger idRequest) {
        this.idRequest = idRequest;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Collaboration) {
            Collaboration anotherCollaboration = (Collaboration) obj;
            return this.idProposal.equals(anotherCollaboration.idProposal)
                    && this.idRequest.equals(anotherCollaboration.idRequest);
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

    public static Collaboration factoryCollaboration(AtomicInteger idProposal, AtomicInteger idRequest, String hourOnDescription) {
        Collaboration collaboration = new Collaboration();
        try {
            Integer numberOfHours = Integer.parseInt(hourOnDescription);
            if (numberOfHours < 2)
                collaboration.setHours(DEFAULT_HOURS);
            else
                collaboration.setHours(numberOfHours);
        } catch (NumberFormatException e) {
            System.out.println("error con el numero de horas");
            collaboration.setHours(DEFAULT_HOURS);
        } finally {
            collaboration.setIdProposal(idProposal);
            collaboration.setIdRequest(idRequest);
        }
        return collaboration;

    }
}
