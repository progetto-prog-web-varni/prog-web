package Controllers;

import ConfImporter.CookieConf;
import Utils.Database;
import Utils.Log;
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

        //guardo se ha cookies
        // Non so se serve a qualcosa questa sezione, ma ho paura a toglierla.
        boolean hasCookie = false;
        String usernameCookie= null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(CookieConf.DefaultCookieName)) {
                    hasCookie = true;
                    if (!cookie.getValue().isEmpty()) {
                        usernameCookie = cookie.getValue();
                    }
                    break;
                }
            }
        }

        // Prova a recuperare i parametri dalla richiesta
        try {
            username = request.getParameter("username");
            password = request.getParameter("password");
        } catch (NullPointerException  e) {
            Log.PrintLog(new Log("Username o Password non inseriti. \n " + e, "LoginServlet"));
            response.setContentType("application/json;charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            resp.write(createResponse("false", "Richiesto l'inserimento di password e username"));
            return;
        }

        // Funzione che fa la query del login e torna un bool per indicare se si può fare il login
        try {
            if (loginQuery(this.db.getConn(), username, password)) {
                // Recupera il ruolo dell'utente dal database
                String role = db.getUserRole(this.db.getConn(), username);

                if(hasCookie){
                    Cookie updatedCookie = new Cookie(CookieConf.DefaultCookieName, username);
                    updatedCookie.setMaxAge(CookieConf.CookieDuration);
                    updatedCookie.setPath(CookieConf.DefaultCookiePath);
                    response.addCookie(updatedCookie);
                }

                Log.PrintLog(new Log("Sessione creata", "LoginServlet"));
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);
                session.setMaxInactiveInterval(CookieConf.DefaultInactiveInterval);


                switch (role) {
                    case "amministratore": {
                        String encodeUrl = response.encodeURL("AreaRiservata/amministratore/index.jsp");
                        response.sendRedirect(encodeUrl);
                        break;
                    }
                    case "simpatizzante": {
                        String encodeUrl = response.encodeURL("AreaRiservata/simpatizzante/index.jsp");
                        response.sendRedirect(encodeUrl);
                        break;
                    }
                    case "aderente": {
                        String encodeUrl = response.encodeURL("AreaRiservata/aderente/index.jsp");
                        response.sendRedirect(encodeUrl);
                        break;
                    }
                    default:
                        response.setContentType("application/json;charset=UTF-8");
                        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                        resp.write(createResponse("false", "Ruolo non valido"));
                        break;
                }

            } else {
                // Gestisci l'errore in caso non siano corrette le informazioni di login
                response.setContentType("application/json;charset=UTF-8");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                resp.write(createResponse("false", "User o password non corrispondono o l'utente non esiste"));
            }
        } catch (SQLException e) {
            Log.PrintLog(new Log("SQLException: " + e, "LoginServlet"));
            response.setContentType("application/json;charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.write(createResponse("false", "Avvenuto errore nella comunicazione con il database."));
        };
    }
}
