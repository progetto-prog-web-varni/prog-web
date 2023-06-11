package Controllers;

import Utils.Database;
import Utils.Log;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;


@WebServlet(name = "DonationServlet", value = "/DonationServlet")
public class DonationServlet extends HttpServlet {

    Database db = null;

    public void init() {
        this.db = new Database();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String amountParam = request.getParameter("amount");
        int amount = Integer.parseInt(amountParam);

        boolean donationSuccessful = processDonation(amount);

        String message;
        if (donationSuccessful) {
            message = "Donazione riuscita";
        } else {
            message = "Error processing donation";
        }

        // Dispatch della richiesta al JSP per la visualizzazione del messaggio
        response.sendRedirect(request.getHeader("Referer") + "?message=" + message);
    }

    private boolean processDonation(int amount) {
        try {
            Calendar calendar = Calendar.getInstance();
            int mese = calendar.get(Calendar.MONTH) + 1; // "+1" perché i mesi in Calendar sono zero-based

            PreparedStatement checkStmt = this.db.getConn().prepareStatement("SELECT * FROM PAYMENT WHERE MESE = ?");
            checkStmt.setInt(1, mese);
            boolean recordExists = checkStmt.executeQuery().next();
            checkStmt.close();

            if (recordExists) {
                PreparedStatement updateStmt = this.db.getConn().prepareStatement("UPDATE PAYMENT SET valore = valore + ? WHERE MESE = ?");
                updateStmt.setInt(1, amount);
                updateStmt.setInt(2, mese);
                int rowsAffected = updateStmt.executeUpdate();
                updateStmt.close();

                return rowsAffected > 0;
            } else {
                PreparedStatement insertStmt = this.db.getConn().prepareStatement("INSERT INTO PAYMENT (mese, valore) VALUES (?, ?)");
                insertStmt.setInt(1, mese);
                insertStmt.setInt(2, amount);
                int rowsAffected = insertStmt.executeUpdate();
                insertStmt.close();

                return rowsAffected > 0;
            }
        } catch (SQLException ex) {
            Log.PrintLog(new Log("SQLException: " + ex, "DonationServlet"));
            return false;
        }
    }

    public void destroy() {
        this.db.Close();
    }
}
