package com.example.RetrieveInfo;

import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RetrieveAderentiServlet", value = "/RetrieveAderentiServlet")
public class RetrieveAderentiServlet extends HttpServlet {

    String dbURL = "jdbc:derby://localhost:1527/WebDB";
    String user = "App";
    String password = "pw";
    Connection conn = null;

    public void init(){
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, user, password);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("application/json;charset=UTF-8");

        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM USERS WHERE ROLE='aderente'";
            ResultSet results = stmt.executeQuery(sql);

            List<List<Object>> data = new ArrayList<>();

            while (results.next()) {
                String name = results.getString(2);
                String surname = results.getString(3);

                List<Object> entry = new ArrayList<>();
                entry.add(name);
                entry.add(surname);

                data.add(entry);
            }

            results.close();
            stmt.close();

            Gson gson = new Gson();
            String json = gson.toJson(data);

            response.getWriter().write(json);
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
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
