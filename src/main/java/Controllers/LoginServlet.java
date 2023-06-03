package Controllers;

import ConfImporter.DbConf;
import Utils.Database;

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

    Database db;

    @Override
    public void init() throws ServletException {
        super.init();
        this.db = new Database();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Username: " + username + "\t Password" + password);

        PrintWriter out = response.getWriter();
        if(db.loginQuery(username, password)){
            response.getWriter().write("Correct User and Password");
        } else {
            response.getWriter().write("Incorrect user or password");
        };
        out.close();
    }

}
