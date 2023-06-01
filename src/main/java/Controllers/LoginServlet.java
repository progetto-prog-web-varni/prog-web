package Controllers;

import ConfImporter.DbConf;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet{

    DbConf dbConf = new DbConf();

    Connection conn = null;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbConf.dbURL, dbConf.user, dbConf.password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(conn != null) {
            System.out.println("Got Connected");
        }

        response.setContentType("text/html");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Username: " + username + "\t Password" + password);

        PrintWriter out = response.getWriter();

        if(password.equals("admin123")){
            out.print("Welcome, " + username);
            HttpSession session = request.getSession();
            System.out.println(session);
            session.setAttribute("name", username);
        }
        else{
            out.print("Sorry, username or password error!");
            request.getRequestDispatcher("login.html").include(request, response);
        }
        out.close();
    }

}
