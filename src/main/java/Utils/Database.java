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
        To run query outside this function.
     */
    public Connection getConn() {
        return conn;
    }

    private void createFakeDB(){
        BufferedReader reader;
        try {
            InputStream is = getFileAsIOStream("database.txt");
            StringBuilder resultStringBuilder = new StringBuilder();
            reader = new BufferedReader(new InputStreamReader(is));
            String line;

            while ((line = reader.readLine()) != null) {
                resultStringBuilder.append(line).append("\n");
            }

            /*while (line != null) {
                for (String s: line.split(",")) {
                    System.out.println(s);
                };
                // read next line
                line = reader.readLine();
            }*/
            reader.close();
            // funziona
            System.out.println(resultStringBuilder.toString());
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
