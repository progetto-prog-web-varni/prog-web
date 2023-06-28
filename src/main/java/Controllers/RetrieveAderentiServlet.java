package Controllers;

import Utils.Database;
import Utils.Log;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

/**
 * Returns a JSON object with all the Aderenti Users
 */
@WebServlet(name = "RetrieveAderentiServlet", value = "/RetrieveAderentiServlet")
public class RetrieveAderentiServlet extends HttpServlet {

    Database db = null;

    public void init(){
        this.db = new Database();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("application/json;charset=UTF-8");

        try {
            Statement stmt = db.getConn().createStatement();
            String sql = "SELECT * FROM USERS WHERE ROLE='aderente'";
            String resp = this.db.ExecuteRetrieveQuery(stmt, sql);

            response.getWriter().write(resp);
        } catch (SQLException | NullPointerException ex) {
            Log.PrintLog(new Log("SQLException: \n" + ex, "RetrieveAderentiServlet"));
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
        this.db.Close();
    }
}
