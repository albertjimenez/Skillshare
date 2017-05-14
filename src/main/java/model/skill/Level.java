package model.skill;

/**
 * Created by Beruto and Pablo Berbel on 15/3/17. Project -> skillshare
 */
public enum Level {

    N, M, A;

    /**
     * Newbie, Medium, Advanced
     *
     * @param stringLevel
     * @return
     */

    public static Level getEnum(String stringLevel) {
        switch (stringLevel.toUpperCase().charAt(0)) {
            case 'N':
                return Level.N;
            case 'M':
                return Level.M;
            case 'A':
                return Level.A;
            default:
                return Level.N;
        }
    }

    public static String getLevelToString(Level level) {
        switch (level) {
            case A:
                return "Avanzado";
            case M:
                return "Medio";
            default:
                return "Novato";
        }
    }

//    @Override
//    public String toString() {
//        return getLevelToString(this);
//    }
}
