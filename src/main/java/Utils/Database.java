package Utils;

import ConfImporter.DbConf;
import Models.Activity;
import Models.User;

import java.io.*;
import java.sql.Connection;
import java.util.ArrayList;

public class Database {
    private static ArrayList<Activity>  activityArray = new ArrayList<>();
    private static ArrayList<User> userArray = new ArrayList<>();

    DbConf dbConf = new DbConf();

    Connection conn = null;

    public Database() {
        // Default connessione al db
        /*
        Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbConf.dbURL);
            System.out.println("Got Connected");
        } catch (ClassNotFoundException | SQLException e) {*/
            createFakeDB();
         // }
    }

    /*
        Return conn pointer, to run query outside this function.
     */
    public Connection getConn() {
        return conn;
    }

    /*
        Read File and add every user present in the file.
     */
    private void createFakeDB(){
        BufferedReader reader;
        try {
            InputStream is = getFileAsIOStream("database.txt");
            reader = new BufferedReader(new InputStreamReader(is));
            String line;

            while ((line = reader.readLine()) != null) {

                User u = new User();
                u.setId(userArray.size() + 1);
                
                String[] lineStr = line.split(";");
                u.setName(lineStr[0].trim());
                u.setSurname(lineStr[1].trim());
                u.setBirthdate(lineStr[2].trim());
                u.setEmail(lineStr[3].trim());
                u.setUsername(lineStr[4].trim());
                u.setPassword(lineStr[5].trim());
                try {
                    u.setRole(lineStr[6].trim());
                } catch (Exception e) {
                    System.out.println("Errore nel parsing del role" + e);
                }

                userArray.add(u);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private InputStream getFileAsIOStream(final String fileName){
        try {
            InputStream ioStream = this.getClass()
                    .getClassLoader()
                    .getResourceAsStream(fileName);
            if (ioStream == null) {
                throw new IllegalArgumentException(fileName + " is not found");
            }

            return ioStream;
        } catch (Exception e) {
            throw new IllegalArgumentException(fileName + " is not found, with exception");
        }
    }

    public boolean loginQuery(String username, String password){
        for(User u: userArray) {
            if(username.equals(u.getUsername()) && password.equals(u.getPassword())){
                return true;
            };
        }
        return false;
    }

}
