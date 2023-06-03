package Controllers;

import Utils.Database;
import Utils.ResponseObj;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.server.ExportException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet{

    Database db;

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
        response.setContentType("application/json;charset=UTF-8");
        String username;
        String password;
        String cookies;
        try {
            username = request.getParameter("username");
            password = request.getParameter("password");
            cookies = request.getParameter("cookies");
        } catch (NullPointerException  e) {
            response.setStatus(HttpServletResponse.SC_OK);
            resp.write(createResponse("false", "Richiesto l'inserimento di password e username"));
            return;
        }

        if(db.loginQuery(username, password)){
            response.setStatus(HttpServletResponse.SC_OK);
            resp.write(createResponse("true", "Inseriti Password e user corretti"));
            if(cookies.equals("true")){
                // set cookies - NON FUNZIONA EUQSTA COSA
                System.out.println("create sessions and send cookies");
                Cookie cookie = new Cookie("auth", "QUESTO VALORE ASSEGANTO A CASO");
                // Imposta la durata del cookie (in secondi)
                cookie.setMaxAge(60); // 24 ore
                // Imposta il percorso del cookie (se necessario)
                cookie.setPath("/");
                // Aggiunge il cookie alla risposta
                response.addCookie(cookie);
            }
            // response.sendRedirect(request.getContextPath() + "/AreaRiservata/index.jsp");
        } else {
            response.setStatus(HttpServletResponse.SC_OK);
            resp.write(createResponse("false", "User o password non corrispondo o l'utente non esiste"));
        };
    }
}
