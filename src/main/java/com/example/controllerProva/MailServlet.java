package com.example.controllerProva;

import javax.servlet.ServletException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MailServlet", value = "/MailServlet")
public class MailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;         //boh?

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("fname");
        String cognome = request.getParameter("lname");
        String email = request.getParameter("email");
        String contact_reason = request.getParameter("contact_reason");
        String feedback = request.getParameter("feedback");

        // manda la mail
        inviaEmail(nome, cognome, email, contact_reason, feedback);

        // reindirizza alla pagina di conferma
        response.sendRedirect("confirm_contatti.jsp?email=" + email);
    }

    private void inviaEmail(String nome, String cognome, String email, String contact_reason, String feedback) {
        //qui invia la mail bro

        String host = "smtp.office365.com";
        String port = "587";
        String mailFrom = "gfalert@outlook.com";
        String password = "PdBezSdYUW6RGrf44WYj";

        // outgoing message information
        //String mailTo = "dalbosco.alby@gmail.com";
        String mailTo = email;
        String subject = "Richiesta contatto Tum4World";

        // message contains HTML markups
        String message = " <h1>Richiesta contatto Tum4World </h1> <p> Gentile " + nome + " " + cognome + ", la sua richiesta ricevuta e' stata ricevuta correttamente dal nostro staff, le faremo sapere al piu' presto!</p> " + " <p> Questi sono i dettagli della sua richiesta: <br> - Contattato per: " + contact_reason + " <br> - Dettagli richiesta: " + feedback + " </p> <br> <br> <br> <p> Lo staff Tum4World </p>";
        try {
            sendHtmlEmail(host, port, mailFrom, password, mailTo,
                    subject, message);
            System.out.println("Email sent.");
        } catch (Exception ex) {
            System.out.println("Failed to sent email.");
            ex.printStackTrace();
        }

        System.out.println("Dati della mail:");
        System.out.println(message);
    }


    public void sendHtmlEmail(String host, String port, final String userName, final String password,
                              String toAddress, String subject, String message) throws AddressException, MessagingException {
        // setto le proprietà del server SMTP
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creo una nuova sessione con Autenticatore, classe Java che rappresenta un oggetto che simula l'autenticazione per una connessione network.
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        //creo una sessione per salvare i dati momentaneamente...
        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        // set plain text message
        msg.setContent(message, "text/html");

        // sends the e-mail
        Transport.send(msg);
    }
}