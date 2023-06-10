package Controllers;

import Utils.Database;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebFilter("/*")
public class CounterFilter implements Filter {

    private Database db = null;

    public void init(FilterConfig config) throws ServletException {
        this.db = new Database();
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        String pageNameUri = request.getRequestURI();
        String pageName=null;
        switch (pageNameUri){
            case "/programmazioneWeb_war_exploded/index.jsp":
                pageName = "Home";
                break;
            case "/programmazioneWeb_war_exploded/chiSiamo.jsp":
                pageName = "Chi_Siamo";
                break;
            case "/programmazioneWeb_war_exploded/attivita.jsp":
                pageName = "Attivita";
                break;
            case "/programmazioneWeb_war_exploded/contatti.jsp":
                pageName = "Contatti";
                break;
            case "/programmazioneWeb_war_exploded/sign-up.jsp":
                pageName = "Signup";
                break;
            case "/programmazioneWeb_war_exploded/login.jsp":
                pageName = "Login";
                break;
        }


        if(pageName!=null){
            increaseCounter(pageName);
        }


        // Passa la richiesta al prossimo filtro o servlet
        chain.doFilter(req, resp);
    }

    public void destroy() {
        try {
            this.db.getConn().close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
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
            ex.printStackTrace();
        }
    }
}
