package Controllers;

import Utils.Database;
import Utils.ResponseObj;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.awt.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import static Utils.Database.loginQuery;

@WebServlet(name = "SignupServlet", value = "/SignupServlet")
public class SignupServlet extends HttpServlet{

    Database db=null;
    public void init() {
        this.db = new Database();
    }


    protected boolean check_username(HttpServletResponse response, String username) throws IOException{
        try{

            PreparedStatement checkStmt = db.getConn().prepareStatement("SELECT USERNAME FROM USERS WHERE USERNAME=?");
            checkStmt.setString(1, username);

            boolean query_result = checkStmt.executeQuery().next();

            if(query_result){
                System.out.println("username occupato");
                checkStmt.close();
                return true;                                    // trovata una corrispondenza.
            }else{
                System.out.println("prosegui");
                checkStmt.close();
                return false;                       // non è stata trovata nessuna corrispondenza.
            }
        }catch(SQLException | NullPointerException ex){
            System.out.println("check user wrong");
            System.out.println(ex);
            return false;
        }
    }

    protected void new_entry_db(HttpServletResponse response, String fname, String lname, String birthday, String email, String membershipType, String username, String password){
        try{

            PreparedStatement checkStmt = db.getConn().prepareStatement("INSERT INTO USERS (NAME, SURNAME, BIRTHDATE, EMAIL, USERNAME, PASSWORD, ROLE) VALUES (?,?,?,?,?,?,?)");
            checkStmt.setString(1, fname);
            checkStmt.setString(2, lname);
            checkStmt.setString(3, birthday);
            checkStmt.setString(4, email);
            checkStmt.setString(5, username);
            checkStmt.setString(6, password);
            checkStmt.setString(7, membershipType);


            int risultato=checkStmt.executeUpdate();
            //stmt.executeQuery(entry_db);
            System.out.println("sei nell'inserimento");
            System.out.println(risultato);
            System.out.println(checkStmt);

            checkStmt.close();
        }catch(SQLException | NullPointerException ex){
            System.out.println("sbagliato");
            System.out.println(ex);

            // response.setStatus(__immetere pagina di errore_);
        }
    }

    private String createResponse(String success, String message){
        ResponseObj resp = new ResponseObj(success, message, "");
        Gson gson = new Gson();
        return gson.toJson(resp);
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
            resp.write(createResponse("false", "Richiesto l'inserimento di password e username"));
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

        boolean OK=check_username(response, username);
        System.out.println(OK);
        if(OK){
             response.sendRedirect("index.jsp");
        }else{
            new_entry_db(response, fname, lname, birthday, email, membershipType, username, password);
            response.sendRedirect("confirm_signup.jsp");       //NON SO IL NOME VERO! (EDDIE PAGE NAME)
        }
    }
}