package Controllers;

import Utils.Database;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "RetrieveInfoServlet", value = "/RetrieveInfoServlet")
public class RetrieveInfoServlet extends HttpServlet {
    Database db = null;

    public void init() {
        this.db = new Database();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("application/json;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String usernameServlet = (String) session.getAttribute("username");

        try {
            PreparedStatement stmt = db.getConn().prepareStatement("SELECT name, surname, birthdate, email, username FROM users WHERE username = ?");
            stmt.setString(1, usernameServlet);
            ResultSet results = stmt.executeQuery();

            if (results.next()) {
                String name = results.getString("name");
                String surname = results.getString("surname");
                String birthdate = results.getString("birthdate");
                String email = results.getString("email");
                String username = results.getString("username");

                //creo json
                Gson gson = new Gson();
                String json = gson.toJson(new User(name, surname, birthdate, email, username));

                response.getWriter().write(json);
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("User not found");
            }

            results.close();
            stmt.close();
        } catch (SQLException | NullPointerException ex) {
            ex.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error retrieving user data from the database.");
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
        try {
            db.getConn().close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //meglio se lo prendo da model?
    private static class User {
        private final String name;
        private final String surname;
        private final String birthdate;
        private final String email;
        private final String username;

        public User(String name, String surname, String birthdate, String email, String username) {
            this.name = name;
            this.surname = surname;
            this.birthdate = birthdate;
            this.email = email;
            this.username = username;
        }
    }
}
