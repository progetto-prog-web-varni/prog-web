package Controllers;

import Utils.Database;
import Utils.ResponseObj;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import static Utils.Database.loginQuery;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet{

    Database db;

    public LoginServlet() { super(); }

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
        String username;
        String password;
        // Prova a recuperare i parametri dalla richiesta
        try {
            username = request.getParameter("username");
            password = request.getParameter("password");
        } catch (NullPointerException  e) {
            response.setContentType("application/json;charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            resp.write(createResponse("false", "Richiesto l'inserimento di password e username"));
            return;
        }

        // Funzione che fa la query del login e torna un bool per indicare se si può fare il login
        try {
            if (loginQuery(this.db.getConn(), username, password)) {
                response.setStatus(HttpServletResponse.SC_OK);
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                // Set Cookie and Session
                session.setMaxInactiveInterval(60);
                Cookie userName = new Cookie("username", username);
                userName.setMaxAge(60 * 60);
                response.setContentType("text/html");
                response.addCookie(userName);
                // Redirect
                response.sendRedirect("AreaRiservata/");
            } else {
                // Gestisci l'errore in caso non siano corrette le informazioni di login
                response.setContentType("application/json;charset=UTF-8");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                resp.write(createResponse("false", "User o password non corrispondono o l'utente non esiste"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("application/json;charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.write(createResponse("false", "Avvenuto errore nella comunicazione con il database."));
        };
    }
}
