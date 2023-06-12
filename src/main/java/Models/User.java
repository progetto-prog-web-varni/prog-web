package Models;


public class User {
    private int id;
    private String name;
    private String surname;
    private String birthdate;
    private String email;
    private String phone;
    private String username;
    private String password;
    private Role role ;

    public User() {
        this.name = "";
        this.surname = "";
        this.birthdate = "";
        this.email = "";
        this.phone = "000-000-0000";
        this.username = "";
        this.password = "";
        this.role = Role.ADERENTE; // default
    }

    public User(String name, String surname, String birthdate, String email,String phone, String username) {
        this.name = name;
        this.surname = surname;
        this.birthdate = birthdate;
        this.email = email;
        this.phone = phone;
        this.username = username;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(String role) throws Exception {
        switch (role) {
            case "amministratore":
            case "admin":
            case "ADMIN":
                this.role = Role.ADMIN;
                break;
            case "SIMPATIZZANTE":
            case "simpatizzante":
                this.role = Role.SIMPATIZZANTE;
                break;
            case "ADERENTE":
            case "aderente":
                this.role = Role.ADERENTE;
                break;
            default:
                throw new Exception("Role Error, please use one of the specified name to describe errors");
        }
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

    @Override
    public String toString() {
        return "Name: " + this.name
                + " Surname: " + this.surname
                + " Birtday: " + this.birthdate
                + " Email: " + this.email
                + " Username: " + this.username
                + " Password: " + this.password;
    }
}
