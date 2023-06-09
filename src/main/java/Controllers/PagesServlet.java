package Controllers;

import Utils.Database;
import Utils.Log;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@WebServlet(name = "PagesServlet", value = "/PagesServlet")
public class PagesServlet extends HttpServlet {
    Database db = null;

    public void init() {
        this.db = new Database();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=UTF-8");

        try {
            Statement stmt = db.getConn().createStatement();
            String sql = "SELECT * FROM COUNTERS";
            ResultSet results = stmt.executeQuery(sql);

            List<List<Object>> data = new ArrayList<>();

            while (results.next()) {
                String pages = results.getString(2);
                int hits = results.getInt(3);

                List<Object> entry = new ArrayList<>();
                entry.add(pages);
                entry.add(hits);

                data.add(entry);
            }

            results.close();
            stmt.close();

            Gson gson = new Gson();
            String json = gson.toJson(data);

            response.getWriter().write(json);
        } catch (SQLException | NullPointerException ex) {
            Log.PrintLog(new Log("SQLException: \n" + ex, "PageServlet"));
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

    public void destroy() {
        this.db.Close();
    }
}
