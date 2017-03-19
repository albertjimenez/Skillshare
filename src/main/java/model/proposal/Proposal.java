package model.proposal;

import model.skill.Level;

import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by Beruto and Pablo Berbel on 16/3/17. Project -> skillshare
 */
public class Proposal {

    //For getting sequence: nextval('proposal_of_collaboration_id_seq')
    private AtomicInteger id;
    private String nif, skillName, description;
    private Level level;
    private Date initialDate, finishDate;

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

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
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

    public Date getInitialDate() {
        return initialDate;
    }

    public void setInitialDate(Date initialDate) {
        this.initialDate = initialDate;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
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
                ", skillName='" + skillName + '\'' +
                ", level=" + level +
                ", description='" + description + '\'' +
                ", initialDate=" + initialDate +
                ", finishDate=" + finishDate +
                '}';
    }
}
