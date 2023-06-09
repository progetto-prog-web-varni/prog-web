package Utils;

import ConfImporter.DbConf;
import Models.Activity;
import Models.Counter;
import Models.Payment;
import Models.User;
import com.google.gson.Gson;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Database {
    private static final ArrayList<Activity> activityArray = new ArrayList<>();
    private static final ArrayList<User> userArray = new ArrayList<>();

    private static final ArrayList<Payment> paymentArray = new ArrayList<>();

    private static final ArrayList<Counter> counterArray = new ArrayList<>();

    private static boolean fakeDbIsSet = false;

    public static final DbConf dbConf = new DbConf();

    Connection conn = null;

    public Database() {
        if (dbConf.useRealDB) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                this.conn = DriverManager.getConnection(dbConf.dbURL, dbConf.user, dbConf.password);
                Log.PrintLog(new Log("Connesso al database correttamente.", "Database"));
            } catch (ClassNotFoundException | SQLException e) {
                createFakeDB();
            }
        } else {
            createFakeDB();
        }
    }

    /// Return conn pointer, to run query outside this function.
    public Connection getConn() {
        return conn;
    }

    public void Close() {
        try {
            this.conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Check se i database sono già stati letti per la prima volta, se no li esegue.
    private void createFakeDB() {
        if (!fakeDbIsSet) {
            boolean paymentStatus = recoverPaymentFromFile();
            boolean activityStatus = recoverActvitiesFromFile();
            boolean userStatus = recoverUserFromFile();
            boolean counterStatus = recoverHitsCounterFile();

            if (paymentStatus && activityStatus && userStatus && counterStatus) fakeDbIsSet = true;
        }
    }

    // Read file payments.txt, parse it, and load in the array.
    private boolean recoverPaymentFromFile() {
        BufferedReader reader;
        try {
            InputStream is = getFileAsIOStream("payments.txt");
            reader = new BufferedReader(new InputStreamReader(is));
            String line;

            while ((line = reader.readLine()) != null) {

                Payment p = new Payment();

                String[] lineStr = line.split(";");
                p.setMese(Integer.parseInt(lineStr[0].trim()));
                p.setValore(Integer.parseInt(lineStr[1].trim()));

                paymentArray.add(p);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    // Read file activities.txt, parse it, and load in the array.
    private boolean recoverActvitiesFromFile() {
        BufferedReader reader;
        try {
            InputStream is = getFileAsIOStream("activities.txt");
            reader = new BufferedReader(new InputStreamReader(is));
            String line;

            while ((line = reader.readLine()) != null) {

                Activity a = new Activity();

                String[] lineStr = line.split(";");

                a.setUserId(Integer.parseInt(lineStr[0].trim()));
                a.setActivity1(lineStr[1].trim());
                a.setActivity2(lineStr[2].trim());
                a.setActivity3(lineStr[3].trim());

                activityArray.add(a);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    private boolean recoverHitsCounterFile() {
        BufferedReader reader;
        try {
            InputStream is = getFileAsIOStream("hitscunt.txt");
            reader = new BufferedReader(new InputStreamReader(is));
            String line;

            while ((line = reader.readLine()) != null) {

                Counter a = new Counter();

                String[] lineStr = line.split(";");

                a.setID(counterArray.size() + 1);
                a.setPageName(lineStr[0].trim());
                a.setHits(Integer.parseInt(lineStr[1].trim()));
                counterArray.add(a);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    // Read the file users.txt, parse it, and load in the array.
    private boolean recoverUserFromFile() {
        BufferedReader reader;
        try {
            InputStream is = getFileAsIOStream("users.txt");
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
            return false;
        }

        return true;
    }

    // To read files for fakedb.
    private InputStream getFileAsIOStream(final String fileName) {
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

    public static boolean loginQuery(Connection conn, String username, String password) throws SQLException {
        // Fake DB
        if (!dbConf.useRealDB) {
            for (User u : userArray) {
                if (username.equals(u.getUsername()) && password.equals(u.getPassword())) {
                    return true;
                }
            }
            return false;
        }
        // Default
        try {
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM USERS WHERE USERNAME = ? AND PASSWORD = ?");
            checkStmt.setString(1, username);
            checkStmt.setString(2, password);
            boolean recordExists = checkStmt.executeQuery().next();
            checkStmt.close();

            // Return true/false
            return recordExists;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public String getUserRole(Connection conn, String username) throws SQLException {
        String role = "";

        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT role FROM users WHERE USERNAME = ?");
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                role = rs.getString("role");
            }

            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return role;
    }

    public String ExecuteRetrieveQuery(Statement stmt, String sql)
            throws SQLException, IOException {

        ResultSet results = stmt.executeQuery(sql);

        List<List<Object>> data = new ArrayList<>();

        while (results.next()) {
            String name = results.getString(2);
            String surname = results.getString(3);

            List<Object> entry = new ArrayList<>();
            entry.add(name);
            entry.add(surname);

            data.add(entry);
        }

        results.close();
        stmt.close();

        Gson gson = new Gson();
        String json = gson.toJson(data);

        return json;
    }
}

