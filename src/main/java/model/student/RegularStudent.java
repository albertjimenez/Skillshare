package model.student;

/**
 * Created by Beruto on 12/3/17.
 */
public class RegularStudent implements StudentInterface {

    String nif, username, password, name, email, degree;
    int course;

    public String getNif() {
        return nif;
    }

    public void setNif(String nif) {
        this.nif = nif;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public int getCourse() {
        return course;
    }

    public void setCourse(int course) {
        this.course = course;
    }

    @Override
    public boolean equals(Object obj) {
        //TODO FIX Interface StudentInterface below
        if (obj instanceof RegularStudent) {
            RegularStudent anotherStudent = (RegularStudent) obj;
            return nif.toLowerCase().equals(anotherStudent.nif.toLowerCase());
        }
        return false;
    }

    @Override
    public String toString() {
        return "NIF: "+nif+" NAME: "+name;
    }
}
