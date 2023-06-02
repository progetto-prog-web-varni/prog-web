package com.example.RetrieveInfo;

import com.google.gson.Gson;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;


@WebServlet(name = "DonationServlet", value = "/DonationServlet")
public class DonationServlet extends HttpServlet {
    String dbURL = "jdbc:derby://localhost:1527/WebDB";
    String user = "App";
    String password = "pw";
    Connection conn = null;

    public void init() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, user, password);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
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

        request.setAttribute("message", message);

        // Dispatch della richiesta al JSP per la visualizzazione del messaggio
        RequestDispatcher dispatcher = request.getRequestDispatcher("chiSiamo.jsp");
        dispatcher.forward(request, response);
    }

    private boolean processDonation(int amount) {
        try {
            Calendar calendar = Calendar.getInstance();
            int mese = calendar.get(Calendar.MONTH) + 1; // "+1" perché i mesi in Calendar sono zero-based

            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM PAYMENT WHERE MESE = ?");
            checkStmt.setInt(1, mese);
            boolean recordExists = checkStmt.executeQuery().next();
            checkStmt.close();

            if (recordExists) {
                PreparedStatement updateStmt = conn.prepareStatement("UPDATE PAYMENT SET valore = valore + ? WHERE MESE = ?");
                updateStmt.setInt(1, amount);
                updateStmt.setInt(2, mese);
                int rowsAffected = updateStmt.executeUpdate();
                updateStmt.close();

                return rowsAffected > 0;
            } else {
                PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO PAYMENT (mese, valore) VALUES (?, ?)");
                insertStmt.setInt(1, mese);
                insertStmt.setInt(2, amount);
                int rowsAffected = insertStmt.executeUpdate();
                insertStmt.close();

                return rowsAffected > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public void destroy() {
        try {
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
