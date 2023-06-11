package Controllers;

import Utils.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import Utils.Log;
import Utils.ResponseObj;
import com.google.gson.Gson;
import com.sun.org.apache.bcel.internal.generic.CHECKCAST;
import com.sun.org.apache.xpath.internal.operations.Bool;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.*;

@WebServlet(name = "ServletAttivita", value = "/ServletAttivita")
public class ServletAttivita extends HttpServlet {
    Database db=null;
    public void init() {
        this.db = new Database();
    }


    protected Boolean[] check_activity(HttpServletResponse response, String username) throws IOException {
        try{
            PreparedStatement checkStmt = this.db.getConn()
                    .prepareStatement("SELECT ACTIVITY1, ACTIVITY2, ACTIVITY3 from ACTIVITY join USERS on ACTIVITY.USERID = USERS.ID WHERE USERNAME=?");
            checkStmt.setString(1, username);

            ResultSet results = checkStmt.executeQuery();
            Boolean[] str = new Boolean[3];
            str[0] = results.getBoolean(1);
            str[1] = results.getBoolean(2);
            str[2] = results.getBoolean(3);

            results.close();
            checkStmt.close();
            return str;

        }catch(SQLException | NullPointerException ex){
            Log.PrintLog(new Log("Activity Check andato male: \n" + ex, "ServletAttivita"));
            Boolean[] booleans = new Boolean[0];
            return booleans;
        }
    }

    protected void new_entry_activityDB(String username, Boolean act1, Boolean act2, Boolean act3){
        try{
            PreparedStatement checkStmt = this.db.getConn()
                    .prepareStatement("SELECT ID from USERS where USERNAME = ?");
            checkStmt.setString(1, username);
            String id = checkStmt.executeQuery().getString(1);

            checkStmt = this.db.getConn()
                    .prepareStatement("INSERT INTO ACTIVITY (USERID, ACTIVITY1, ACTIVITY2, ACTIVITY3) VALUES (?,?,?,?)");

            checkStmt.setString(1, id);
            checkStmt.setBoolean(2, act1);
            checkStmt.setBoolean(3, act2);
            checkStmt.setBoolean(4, act3);


            int risultato = checkStmt.executeUpdate();
            Log.PrintLog(new Log("Inserimento nuova Activity. (" + risultato + ")", "ServletAttivita"));

            checkStmt.close();
        }catch(SQLException | NullPointerException ex){
            Log.PrintLog(new Log("Errore nell'inserimento nuova attività: \n" + ex, "ServletAttivita"));
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // PrintWriter resp = response.getWriter();
        String username;
        Boolean act1;
        Boolean act2;
        Boolean act3;

        try {
            username = request.getParameter("username");
            act1 = request.getParameter("")
        } catch (NullPointerException  e) {
            response.setContentType("application/json;charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            ResponseObj respGson = new ResponseObj("false", "Richiesto l'inserimento di password e username", "");
            Gson gson = new Gson();
            resp.write(gson.toJson(respGson));
            return;
        }

        System.out.println(
                "USERNAME:" + fname +
                        " LASTNAME: " + lname +
                        " Birtday: " + birthday +
                        " Email: " + email +
                        " Phone: " + phone +
                        " SelectionInput: " + membershipType +
                        " Username: " + username +
                        " Password: " + password +
                        " Conferma Password: " + confirm_password);

        // true => username già presente
        boolean OK=check_username(response, username);
        if(OK){
            response.sendRedirect("sign-up.jsp?error=" + URLEncoder.encode("Err 13: Username già presente!", "UTF-8"));
        }else{
            new_entry_db(fname, lname, birthday, email, membershipType, username, password);
            response.sendRedirect("confirm_signup.jsp");
        }
    }

    @Override
    public void destroy() {
        this.db.Close();
    }




}
