import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletRequest;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.*;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;

@WebServlet(value = "mail-servlet")
public class MailServlet extends HttpServlet {

    String host = "smtp.gmail.com";
    String port = "587";
    String mailFrom = "gigiobagigio728@gmail.com";
    String password = "Pass00fNR#";

    // outgoing message information
    String mailTo = "no.reply00f@gmail.com";
    String subject = "Richiesta contatto";

    // message contains HTML markups
    String message = " Richiesta ricevuta correttamente, le faremo sapere al più presto! ";

    public void init() {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String reason = request.getParameter("contact_reason");
        String feedback = request.getParameter("feedback");

        System.out.println("Nome e cognome: " + fname + " " + lname);
        System.out.println("email: " + email);
        System.out.println("Contact Reason: " + reason);
        System.out.println("Feed back is: " + feedback);

        try {
            sendHtmlEmail(host, port, mailFrom, password, mailTo,
                    subject, message);
            System.out.println("Email sent.");
        } catch (Exception ex) {
            System.out.println("Failed to sent email.");
            ex.printStackTrace();
        }
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
        msg.setText(message);

        // sends the e-mail
        //Transport.send(msg);

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }

    public void destroy() {

    }
}