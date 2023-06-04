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

import static Utils.Database.loginQuery;

@WebServlet(name = "SignupServlet", value = "/SignupServlet")
public class SignupServlet extends HttpServlet{

    Database db;

    public SignupServlet() { super(); }

    @Override
    public void init() throws ServletException {
        super.init();
        this.db = new Database();
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

        // SE tutto ok, si può fare:
        response.sendRedirect("login.jsp");
    }
}
