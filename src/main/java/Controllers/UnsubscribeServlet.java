package Controllers;

import Utils.Database;
import Utils.Log;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

/**
 * Allows users to unsibscribe from the site and remove all the data from database.
 * If ok, return to <code>login.jsp</code>.
 * if not ok, return to <code>error.jsp</code>
 */
@WebServlet(name = "UnsubscribeServlet", value = "/UnsubscribeServlet")
public class UnsubscribeServlet extends HttpServlet {
    Database db = null;

    public void init() {
        this.db = new Database();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");

        try {
            // Togli utente
            PreparedStatement stmt = db.getConn().prepareStatement("DELETE FROM users WHERE username = ?");
            stmt.setString(1, username);
            int affectedRows = stmt.executeUpdate();
            stmt.close();

            if (affectedRows > 0) {
                //vai al login se ti ho tolto
                session.invalidate();
                response.sendRedirect("login.jsp");
            } else {
                //errore
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (SQLException ex) {
            Log.PrintLog(new Log("SQLException: \n" + ex, "UnsibscribeServlet"));
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void destroy() {
       this.db.Close();
    }
}
