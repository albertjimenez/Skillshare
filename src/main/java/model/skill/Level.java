package model.skill;

/**
 * Created by Beruto and Pablo Berbel on 15/3/17. Project -> skillshare
 */
public enum Level {

    NEWBIE, MEDIUM, ADVANCED, UNKNOWN;

    public static Level getEnum(String stringLevel) {
        switch (stringLevel.toUpperCase().charAt(0)) {
            case 'N':
                return Level.NEWBIE;
            case 'M':
                return Level.MEDIUM;
            case 'A':
                return Level.ADVANCED;
            default:
                return Level.UNKNOWN;
        }
    }
}
