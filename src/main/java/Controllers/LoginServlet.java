package Controllers;

import Utils.Database;
import Utils.ResponseObj;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

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
        try {
            username = request.getParameter("username");
            password = request.getParameter("password");
        } catch (NullPointerException  e) {
            response.setContentType("application/json;charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            resp.write(createResponse("false", "Richiesto l'inserimento di password e username"));
            return;
        }

        if(db.loginQuery(username, password)){
            response.setStatus(HttpServletResponse.SC_OK);
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            //setting session to expire in 1 min FOR TESTING
            session.setMaxInactiveInterval(60);
            Cookie userName = new Cookie("username", username);
            userName.setMaxAge(60*60);
            response.setContentType("text/html");
            response.addCookie(userName);
            response.addHeader("x-location", "new location");
            response.sendRedirect("AreaRiservata.jsp");
        } else {
            response.setContentType("application/json;charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            // response.sendRedirect("Login.jsp?error=Username%20inesistente%20o%20password%20errata.");
            resp.write(createResponse("false", "User o password non corrispondono o l'utente non esiste"));
        };
    }
}
