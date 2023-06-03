package Models;

public class User {
    private int id;
    private String name;
    private String surname;
    private String birthdate;
    private String email;
    private String username;
    private String password;
    private enum role {
        ADMIN,
        SIMPATIZZANTE,
        ADERENTE,
    };

    //costruttore senza id
    public User(String name, String surname, String birthdate, String email, String username, String password) {
        this.name = name;
        this.surname = surname;
        this.birthdate = birthdate;
        this.email = email;
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public String getEmail() {
        return email;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    //qua ci possiamo mettere altri metodi

}
