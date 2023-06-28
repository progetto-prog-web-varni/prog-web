package Controllers;

import ConfImporter.Generics;
import Utils.Database;
import Utils.Log;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * This servlet allow the statistic of every page for the <i>Admin Page Analytics Function</i>
 * The Filters intercept every call done to the pages in the lists.
 * To make it works, need the <code>Generics.DefStartingPage</code> that is only a variable that tells about the location
 * of the apps, to correct filtering the requests.
 */
@WebFilter(urlPatterns = {"/index.jsp", "/chiSiamo.jsp","/contatti.jsp", "/login.jsp", "/signup.jsp", "/attivita.jsp"})
public class CounterFilter implements Filter {

    private Database db = null;

    public void init(FilterConfig config) throws ServletException {
        this.db = new Database();
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        String pageNameUri = request.getRequestURI();
        String pageName = null;
        switch (pageNameUri){
            case Generics.DefStartingPage + "index.jsp":
                pageName = "Home";
                break;
            case Generics.DefStartingPage + "chiSiamo.jsp":
                pageName = "Chi_Siamo";
                break;
            case Generics.DefStartingPage + "attivita.jsp":
                pageName = "Attivita";
                break;
            case Generics.DefStartingPage + "contatti.jsp":
                pageName = "Contatti";
                break;
            case Generics.DefStartingPage + "sign-up.jsp":
                pageName = "Signup";
                break;
            case Generics.DefStartingPage + "login.jsp":
                pageName = "Login";
                break;
            default:
                Log.PrintLog(new Log("Got hit from " + pageNameUri, "CounterFilter"));
        }

        if(pageName!=null) increaseCounter(pageName);

        // Passa la richiesta al prossimo filtro o servlet
        chain.doFilter(req, resp);
    }

    public void destroy() {
        this.db.Close();
    }

    private void increaseCounter(String pageName) {
        try {
            PreparedStatement checkStmt = this.db.getConn().prepareStatement("SELECT * FROM COUNTERS WHERE PAGENAME = ?");
            checkStmt.setString(1, pageName);
            ResultSet resultSet = checkStmt.executeQuery();

            if (resultSet.next()) {
                int currentHits = resultSet.getInt("HITS");
                int newHits = currentHits + 1;

                PreparedStatement updateStmt = this.db.getConn().prepareStatement("UPDATE COUNTERS SET HITS = ? WHERE PAGENAME = ?");
                updateStmt.setInt(1, newHits);
                updateStmt.setString(2, pageName);
                updateStmt.executeUpdate();
                updateStmt.close();
            } else {
                PreparedStatement insertStmt = this.db.getConn().prepareStatement("INSERT INTO COUNTERS (PAGENAME, HITS) VALUES (?, 1)");
                insertStmt.setString(1, pageName);
                insertStmt.executeUpdate();
                insertStmt.close();
            }

            resultSet.close();
            checkStmt.close();
        } catch (SQLException ex) {
            Log.PrintLog(new Log("SQLException: " + ex, "CounterFilter"));
        }
    }
}
