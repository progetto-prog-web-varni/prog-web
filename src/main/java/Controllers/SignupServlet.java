package Controllers;

import Utils.Database;
import Utils.Log;
import Utils.ResponseObj;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.*;

@WebServlet(name = "SignupServlet", value = "/SignupServlet")
public class SignupServlet extends HttpServlet{

    Database db=null;
    public void init() {
        this.db = new Database();
    }


    protected boolean check_username(HttpServletResponse response, String username) throws IOException{
        try{

            PreparedStatement checkStmt = this.db.getConn()
                    .prepareStatement("SELECT USERNAME FROM USERS WHERE USERNAME=?");
            checkStmt.setString(1, username);

            boolean query_result = checkStmt.executeQuery().next();

            if(query_result){
                Log.PrintLog(new Log("Username occupato", "SignupServlet"));
                checkStmt.close();
                return true;
            }else{
                Log.PrintLog(new Log("Username non occupato", "SignupServlet"));
                checkStmt.close();
                return false;
            }
        }catch(SQLException | NullPointerException ex){
            Log.PrintLog(new Log("Username Check andato male: \n" + ex, "SignupServlet"));
            return false;
        }
    }

    protected boolean new_entry_db(String fname, String lname, String birthday, String email, String phone,
                                String membershipType, String username, String password){
       try{

            PreparedStatement checkStmt = this.db.getConn()
                    .prepareStatement("INSERT INTO USERS (NAME, SURNAME, BIRTHDATE, EMAIL, PHONE, USERNAME, PASSWORD, ROLE) VALUES (?,?,?,?,?,?,?,?)");
            checkStmt.setString(1, fname);
            checkStmt.setString(2, lname);
            checkStmt.setString(3, birthday);
            checkStmt.setString(4, email);
            checkStmt.setString(5, phone);
            checkStmt.setString(6, username);
            checkStmt.setString(7, password);
            checkStmt.setString(8, membershipType.toLowerCase());

            int risultato = checkStmt.executeUpdate();
            Log.PrintLog(new Log("Inserimento nuovo username. (" + risultato + ")", "SignupServlet"));

            checkStmt.close();

           PreparedStatement checkStmt1 = this.db.getConn()
                   .prepareStatement("SELECT ID FROM USERS WHERE USERNAME = ?");

           checkStmt1.setString(1, username);


           ResultSet res = checkStmt1.executeQuery();

           if(res.next()) {
               String userid = res.getString("ID");

               checkStmt1.close();

               Log.PrintLog(new Log("Username id: " + userid, "SignupServlet"));

               PreparedStatement checkStmt2 = this.db.getConn()
                       .prepareStatement("INSERT INTO ACTIVITY (USERID, ACTIVITY1, ACTIVITY2, ACTIVITY3) VALUES (?,?,?,?)");
               checkStmt2.setString(1, userid);
               checkStmt2.setBoolean(2, false);
               checkStmt2.setBoolean(3, false);
               checkStmt2.setBoolean(4, false);

               risultato = checkStmt2.executeUpdate();

               Log.PrintLog(new Log("Insert activities: " + risultato, "SignupServlet"));

               checkStmt2.close();
           }
           return true;
        }catch(SQLException | NullPointerException ex){
            Log.PrintLog(new Log("Errore nell'inserimento nuovo username: \n" + ex, "SignupServlet"));
            return false;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter resp = response.getWriter();
        String fname;
        String lname;
        String birthday;
        String email;
        String phone;
        String membershipType;
        String username;
        String password;
        String confirm_password;

        try {
            fname = request.getParameter("fname");
            lname = request.getParameter("lname");
            birthday = request.getParameter("birthday");
            email = request.getParameter("email");
            phone = request.getParameter("phone");
            membershipType = request.getParameter("membershipType");
            username = request.getParameter("username");
            password = request.getParameter("password");
            confirm_password = request.getParameter("password");
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
            response.sendRedirect("sign-up.jsp?error=" +
                    URLEncoder.encode("Err 13: Username già presente!", "UTF-8"));
        }else{
            boolean checkNewEntry = new_entry_db(fname, lname, birthday, email, phone, membershipType, username, password);
            if(checkNewEntry){
                response.sendRedirect("confirm_signup.jsp");
            } else {
                response.sendRedirect("sign-up.jsp?error=" +
                        URLEncoder.encode("Err 13: Errore Generico durante la creazione dell'user!", "UTF-8"));
            }

        }
    }

    @Override
    public void destroy() {
        this.db.Close();
    }
}