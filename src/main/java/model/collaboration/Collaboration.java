package model.collaboration;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by PabloBerbel on 28/03/2017.
 */
public class Collaboration {
    private AtomicInteger id;
    public final static String TABLE_COLLAB_PROP = "collaboration_prop";
    public final static String TABLE_COLLAB_REQ = "collaboration_req";
    private int hours, rating;

    public AtomicInteger getId() {
        return id;
    }

    public void setId(AtomicInteger id) {
        this.id = id;
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
            return this.id.equals(anotherCollaboration.id);
        }
        return false;
    }

    @Override
    public String toString() {
        return "Collaboration{" +
                "id=" + id +
                ", hours=" + hours +
                ", rating=" + rating +
                '}';
    }
}
