package model.proposal;

import model.skill.Level;

import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 16/3/17. Project -> skillshare
 */
public class Proposal {

    //For getting sequence: nextval('proposal_of_collaboration_id_seq')
    AtomicInteger id;
    String nif, skillname;
    Level level;
    String description;
    Date initial_date, finish_date;

    public AtomicInteger getId() {
        return id;
    }

    public void setId(AtomicInteger id) {
        this.id = id;
    }

    public String getNif() {
        return nif;
    }

    public void setNif(String nif) {
        this.nif = nif;
    }

    public String getSkillname() {
        return skillname;
    }

    public void setSkillname(String skillname) {
        this.skillname = skillname;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getInitial_date() {
        return initial_date;
    }

    public void setInitial_date(Date initial_date) {
        this.initial_date = initial_date;
    }

    public Date getFinish_date() {
        return finish_date;
    }

    public void setFinish_date(Date finish_date) {
        this.finish_date = finish_date;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Proposal) {
            Proposal anotherProposal = (Proposal) obj;
            return this.id.equals(anotherProposal.id);
        }
        return false;
    }

    @Override
    public String toString() {
        return "Proposal{" +
                "id=" + id +
                ", nif='" + nif + '\'' +
                ", skillname='" + skillname + '\'' +
                ", level=" + level +
                ", description='" + description + '\'' +
                ", initial_date=" + initial_date +
                ", finish_date=" + finish_date +
                '}';
    }
}
