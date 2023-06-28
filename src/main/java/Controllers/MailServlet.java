package Controllers;

import ConfImporter.SMTPConf;
import Utils.Log;

import javax.servlet.ServletException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.net.URLEncoder;
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

/**
 * Execute the operations of sending to the admin of the site a request of contact.
 * In the request there must be present: fname, lname, email, contact_reason, feedback.
 * Returns to <code>confirm_contatti.jsp</code> with the possibility of adding a <code>message</code> URL params
 * to contains some sort of error/success message to be print in the interface.
 */
@WebServlet(name = "MailServlet", value = "/MailServlet")
public class MailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome;
        String cognome;
        String email;
        String contact_reason;
        String feedback;

        try {
            nome = request.getParameter("fname");
            cognome = request.getParameter("lname");
            email = request.getParameter("email");
            contact_reason = request.getParameter("contact_reason");
            feedback = request.getParameter("feedback");
        } catch (NullPointerException ex) {
            Log.PrintLog(new Log("Parametri della richiesta no validi.", "MailServlet"));
            response.sendRedirect("confirm_contatti.jsp?error=" + URLEncoder.encode("Parametri non inseriti correttamente", "UTF-8"));
            return;
        }

        // manda la mail
        boolean isSent = inviaEmail(nome, cognome, email, contact_reason, feedback);
        if(isSent){
            // reindirizza alla pagina di conferma
            response.sendRedirect("confirm_contatti.jsp?email=" + email);
        } else {
            response.sendRedirect("confirm_contatti.jsp?error=" + email);
        }
    }

    /**
     * Execute the controls before sending the mail. This function also create the text of what the mail have to contain.
     * @param nome post param got in the precedent function
     * @param cognome post param got in the precedent function
     * @param email post param got in the precedent function
     * @param contact_reason post param got in the precedent function
     * @param feedback post param got in the precedent function
     * @return (boolean) status of the mail sending procedure (fail/success)
     */
    private boolean inviaEmail(String nome, String cognome, String email, String contact_reason, String feedback) {
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
            return false;
        }

        Log.PrintLog(new Log("Dati della mail: \n" + message, "MailServlet"));
        return true;
    }

    /**
     * Contains the logic to connect to the SMTP provider and send the message to the mail defined in the config.
     * @param host SMTPConf.host
     * @param port SMTPConf.port
     * @param userName SMTPConf.userName
     * @param password SMTPConf.password
     * @param toAddress SMTPConf.emailAddress
     * @param subject create in the precedent function
     * @param message created in the precedent function
     * @throws MessagingException from {@link com.sun.mail}
     */
    private void sendHtmlEmail(String host, String port, final String userName, final String password,
                              String toAddress, String subject, String message)
            throws MessagingException {

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