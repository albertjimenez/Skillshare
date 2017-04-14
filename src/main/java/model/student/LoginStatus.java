package model.student;

/**
 * Created by Beruto and Pablo Berbel on 15/4/17. Project -> skillshare
 */
public enum LoginStatus {

    NOT_FOUND, WRONG_PSWD, DUPLICATED, BANNED, VALID;

    private static Student student;


    public static LoginStatus getStatus(Student student) {
        if (student == null)
            return NOT_FOUND;
        if (student.getNif() == null)
            return WRONG_PSWD;
        if (student.getNif().equals("BANEADO"))
            return BANNED;
        if (student.getNif().equals("DUP"))
            return DUPLICATED;
        return VALID;
    }

    public static Student getStudent() {
        return student;
    }

    public static void setStudent(Student student) {
        LoginStatus.student = student;
    }
}
