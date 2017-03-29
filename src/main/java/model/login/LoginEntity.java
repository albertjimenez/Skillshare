package model.login;

/**
 * Created by Beruto and Pablo Berbel on 21/3/17. Project -> skillshare
 */
public class LoginEntity {
    String user, password;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LoginEntity that = (LoginEntity) o;

        if (!user.equals(that.user)) return false;
        return password.equals(that.password);
    }

    public String getUser() {

        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Login{" +
                "user='" + user + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
