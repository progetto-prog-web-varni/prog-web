package Controllers;

import Utils.Database;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;


@WebServlet(name = "RetrieveRegistratiServlet", value = "/RetrieveRegistratiServlet")
public class RetrieveRegistratiServlet extends HttpServlet {

    Database db = null;
    public void init(){
        this.db = new Database();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("application/json;charset=UTF-8");

        try {
            Statement stmt = this.db.getConn().createStatement();
            String sql = "SELECT * FROM USERS WHERE ROLE='aderente' OR ROLE='simpatizzante'";
            String resp = this.db.ExecuteRetrieveQuery(stmt, sql);

            response.getWriter().write(resp);
        } catch (SQLException | NullPointerException ex) {
            ex.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error retrieving data from the database.");
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

    public void destroy(){
        try {
            this.db.getConn().close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
