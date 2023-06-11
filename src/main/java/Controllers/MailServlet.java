package Controllers;

import ConfImporter.SMTPConf;
import Utils.Log;

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

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        String host = SMTPConf.host;
        String port = SMTPConf.port;
        String mailFrom = SMTPConf.mailFrom;
        String password = SMTPConf.password;

        // outgoing message information
        String subject = "Richiesta contatto Tum4World";

        // message contains HTML markups
        String message = " <h1>Richiesta contatto Tum4World </h1> <p> Nuova richiesta di contatto da:  "
                + nome + " " + cognome +
                "</p>, con la seguente mail: <p>" + email + "</p>" +
                "<p> Motivo del contatto: <br> " + contact_reason + " <br> - Dettagli richiesta: "
                + feedback;
        try {
            // Cambiata la logica:
            // La mail deve essere inviata agli amministratori, che poi faranno una richiesta successivamente.
            sendHtmlEmail(host, port, mailFrom, password, SMTPConf.emailAddress, subject, message);
            Log.PrintLog(new Log("Email sent", "MailSevlet"));
        } catch (Exception ex) {
            Log.PrintLog(new Log("Failed to sent email. \n SQLException: " + ex, "MailServlet"));
        }

        Log.PrintLog(new Log("Dati della mail: \n" + message, "MailServlet"));
    }

    public void sendHtmlEmail(String host, String port, final String userName, final String password,
                              String toAddress, String subject, String message)
            throws AddressException, MessagingException {

        // setto le proprietà del server SMTP
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creo una nuova sessione con Autenticatore, classe Java che rappresenta un
        // oggetto che simula l'autenticazione per una connessione network.
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