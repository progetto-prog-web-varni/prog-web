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
        // Leggi l'importo della donazione dalla richiesta POST
        String amountParam = request.getParameter("amount");
        int amount = Integer.parseInt(amountParam);

        // Esegui la logica di elaborazione della donazione
        boolean donationSuccessful = processDonation(amount);

        // Imposta il messaggio da visualizzare nel JSP
        String message;
        if (donationSuccessful) {
            message = "Donazione riuscita";
        } else {
            message = "Error processing donation";
        }

        // Memorizza il messaggio come attributo della richiesta
        request.setAttribute("message", message);

        // Dispatch della richiesta al JSP per la visualizzazione del messaggio
        RequestDispatcher dispatcher = request.getRequestDispatcher("chiSiamo.jsp");
        dispatcher.forward(request, response);
    }

    private boolean processDonation(int amount) {
        try {
            // Recupera il mese corrente
            Calendar calendar = Calendar.getInstance();
            int mese = calendar.get(Calendar.MONTH) + 1; // "+1" perché i mesi in Calendar sono zero-based

            // Verifica se esiste un record per il mese corrente
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM PAYMENT WHERE MESE = ?");
            checkStmt.setInt(1, mese);
            boolean recordExists = checkStmt.executeQuery().next();
            checkStmt.close();

            if (recordExists) {
                // Esegui l'aggiornamento del totale nel database
                PreparedStatement updateStmt = conn.prepareStatement("UPDATE PAYMENT SET valore = valore + ? WHERE MESE = ?");
                updateStmt.setInt(1, amount);
                updateStmt.setInt(2, mese);
                int rowsAffected = updateStmt.executeUpdate();
                updateStmt.close();

                // Verifica se l'aggiornamento è stato eseguito correttamente
                return rowsAffected > 0;
            } else {
                // Inserisci un nuovo record per il mese corrente con l'importo della donazione come totale
                PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO PAYMENT (mese, valore) VALUES (?, ?)");
                insertStmt.setInt(1, mese);
                insertStmt.setInt(2, amount);
                int rowsAffected = insertStmt.executeUpdate();
                insertStmt.close();

                // Verifica se l'inserimento è stato eseguito correttamente
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
