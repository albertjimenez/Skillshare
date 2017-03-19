package model.student;

/**
 * Created by Beruto and Pablo Berbel on 19/3/17. Project -> skillshare
 */
public enum Type {

    CP, CM, NORMAL, MASTER, POSTGRADUATE;

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
            return Type.MASTER;
        if (data.equals("PG"))
            return Type.POSTGRADUATE;
        return Type.NORMAL;

    }
}
