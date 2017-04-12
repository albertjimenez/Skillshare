package model.student;

/**
 * Created by Beruto and Pablo Berbel on 19/3/17. Project -> skillshare
 */
public enum Type {

    CP, CM, NO, MA, PG;

    /**
     * @param type: cadena de 2 caracteres que nos indica el tipo de estudiante
     * @return tipo de estudiante
     */
    public static Type getType(String type) {
        String data = type.substring(0, 2).toUpperCase();
        if (data.equals("CP"))
            return Type.CP;
        if (data.equals("CM"))
            return Type.CM;
        if (data.equals("MA"))
            return Type.MA;
        if (data.equals("PG"))
            return Type.PG;
        if (data.equals("NO"))
            return Type.NO;
        return Type.NO;

    }

    public static String getName(String type) {
        String data = type.substring(0, 2).toUpperCase();
        if (data.equals("CP"))
            return "Promotor de colaboraciones";
        if (data.equals("CM"))
            return "Miembro del consejo";
        if (data.equals("MA"))
            return "Estudiante máster";
        if (data.equals("PG"))
            return "Postgraduado";
        return "Estudiante";

    }
}
