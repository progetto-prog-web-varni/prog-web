package Controllers;

import ConfImporter.CookieConf;
import Models.Payment;
import Utils.Database;
import Utils.Log;
import Utils.ResponseObj;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static Utils.Database.loginQuery;

@WebServlet(name = "SendnewPhrasesServlet", value = "/SendnewPhrasesServlet")
public class SendnewPhrasesServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {}

    private String recoverPhrases() {
        BufferedReader reader;
        try {
            InputStream is = getFileAsIOStream("phrases.txt");
            reader = new BufferedReader(new InputStreamReader(is));
            String line;

            toBeReturned pva = new toBeReturned();

            while ((line = reader.readLine()) != null) {
                String[] splitL = line.split(";");

                pva.add(new PhraseWithAuthor(splitL[0], splitL[1]));
            }
            reader.close();
            Gson gson = new Gson();
            return gson.toJson(pva);
        } catch (IOException e) {
            Log.PrintLog(new Log("Errore nella lettura del file delle frasi. ", "SendnewPhrasesServlet"));
            return "{'status': 'failed', 'err':'Errore a recuperare le frasi.'}";
        }
    }

    private InputStream getFileAsIOStream(final String fileName) {
        try {
            InputStream ioStream = this.getClass()
                    .getClassLoader()
                    .getResourceAsStream(fileName);
            if (ioStream == null) {
                throw new IllegalArgumentException(fileName + " is not found");
            }

            return ioStream;
        } catch (Exception e) {
            throw new IllegalArgumentException(fileName + " is not found, with exception");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.getWriter().write(recoverPhrases());
    }

    static class PhraseWithAuthor{
        String author;
        String Phrase;

        public PhraseWithAuthor(String author, String phrase) {
            this.author = author;
            Phrase = phrase;
        }
    }

    static class toBeReturned {
        public ArrayList<PhraseWithAuthor> pWa;

        public toBeReturned() {
            this.pWa = new ArrayList<>();
        }

        public void add(PhraseWithAuthor a){
            this.pWa.add(a);
        }

        public ArrayList<PhraseWithAuthor> getpWa(){
            return this.pWa;
        }

    }
}
