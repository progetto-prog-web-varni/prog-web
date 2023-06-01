package Models;

public class User {
    private int id;
    private String name;
    private String surname;
    private String birthdate;
    private String email;
    private String username;
    private String password;
    private String role;

    //costruttore senza id
    public User(String name, String surname, String birthdate, String email, String username, String password, String role) {
        this.name = name;
        this.surname = surname;
        this.birthdate = birthdate;
        this.email = email;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    //qua ci possiamo mettere altri metodi
}
