package model.skill;

/**
 * Created by Beruto and Pablo Berbel on 15/3/17. Project -> skillshare
 */
public class Skill {

    private String name, description;
    private Level level;

    /**
     * Empty constructor for {@link mapper.SkillMapper}
     */
    public Skill() {

    }

    /**
     * Full constructor for Testing purposes
     *
     * @param name        Ability name
     * @param level       Level referenced on {@link Level} Enum: 3 types available
     * @param description Brew description
     */
    public Skill(String name, Level level, String description) {
        this.name = name;
        this.level = level;
        this.description = description;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {

        return name;
    }

    public Level getLevel() {
        return level;
    }

    public String getDescription() {
        return description;
    }


    @Override
    public boolean equals(Object obj) {

        if (obj instanceof Skill) {
            Skill anotherSkill = (Skill) obj;
            return this.name.equals(anotherSkill.name) && this.level.equals(anotherSkill.level);
        }
        return false;
    }

    @Override
    public String toString() {
        return "Name: "+name + " Level: "+level + " Description: "+description;
    }
}
