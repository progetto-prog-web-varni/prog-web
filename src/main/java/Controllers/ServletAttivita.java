package Controllers;

import Utils.Database;
import Utils.Log;
import Utils.ResponseObj;
import com.google.gson.Gson;
import org.ietf.jgss.GSSName;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.io.EOFException;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "ServletAttivita", value = "/ServletAttivita")
public class ServletAttivita extends HttpServlet {
    Database db=null;
    public void init() {
        this.db = new Database();
    }


    protected Boolean[] check_activity(String username) throws Exception {
        try{
            PreparedStatement checkStmt = this.db.getConn()
                    .prepareStatement("SELECT ACTIVITY1, ACTIVITY2, ACTIVITY3 from ACTIVITY join USERS on ACTIVITY.USERID = USERS.ID WHERE USERNAME=?");
            checkStmt.setString(1, username);

            ResultSet res = checkStmt.executeQuery();

            Boolean[] str = new Boolean[3];
            if(res.next()) {
                str[0] = res.getBoolean(1);
                str[1] = res.getBoolean(2);
                str[2] = res.getBoolean(3);
                res.close();
            }
            // non gestito il fatto di
            checkStmt.close();
            return str;

        }catch(SQLException | NullPointerException ex){
            Log.PrintLog(new Log("Activity Check andato male: \n" + ex, "ServletAttivita"));
            throw new Exception("Non trovata nessuna attivita' per questo utente oppure un errore generico a DB.");
        }
    }

    protected boolean new_entry_activityDB(String username, Boolean act1, Boolean act2, Boolean act3){
        try{
            PreparedStatement checkStmt = this.db.getConn()
                    .prepareStatement("SELECT ID from USERS where USERNAME = ?");
            checkStmt.setString(1, username);

            ResultSet res = checkStmt.executeQuery();
            String id = "";
            if(res.next()) id = res.getString("ID");

            PreparedStatement checkStmt1 = this.db.getConn()
                    .prepareStatement("UPDATE ACTIVITY SET ACTIVITY1 = ?, ACTIVITY2 = ?, ACTIVITY3 = ? WHERE USERID = ?");

            checkStmt1.setBoolean(1, act1);
            checkStmt1.setBoolean(2, act2);
            checkStmt1.setBoolean(3, act3);
            checkStmt1.setString(4, id);


            int risultato = checkStmt1.executeUpdate();
            Log.PrintLog(new Log("Inserimento nuova Activity. (" + risultato + ")", "ServletAttivita"));
            checkStmt1.close();

            if(risultato >= 1) return true;
            else return false;

        }catch(SQLException | NullPointerException ex){
            Log.PrintLog(new Log("Errore nell'inserimento nuova attività: \n" + ex, "ServletAttivita"));
            return false;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        Boolean act1=Boolean.parseBoolean(req.getParameter("Activity_1"));
        Boolean act2=Boolean.parseBoolean(req.getParameter("Activity_2"));
        Boolean act3=Boolean.parseBoolean(req.getParameter("Activity_3"));

        //controlla parametri validi
        if(username==null || username.isEmpty()){
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.setContentType("text/plain");
            resp.getWriter().write("Invalid parameter");
            return;
        }

        Log.PrintLog(new Log("Username: " + username +" con attività: "+ act1 + " " +act2+ " " + act3, "ServletAttivita"));

        boolean activity_change= new_entry_activityDB(username, act1, act2, act3);
        if(activity_change){
            //redirect to same page
            String redirect_url= req.getContextPath() + "/AreaRiservata/simpatizzante/iscrizione_attivita.jsp";
            resp.sendRedirect(redirect_url);
        } else {
            // Gestisce l'errore
            Gson gson = new Gson();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.setContentType("application/json");
            ResponseObj responseObj = new ResponseObj("false",
                    "Errore generico nell'inserimento delle attivita", "");
            resp.getWriter().write(gson.toJson(responseObj));
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");

        Log.PrintLog(new Log("Username: " + username, "ServletAttivita"));
        Boolean[] res;

        try {

            res = check_activity(username);
            Gson gson = new Gson();
            DataClassToSend dts = new DataClassToSend(res[0], res[1], res[2]);
            resp.setContentType("application/json");
            resp.getWriter().write(gson.toJson(dts));

        } catch (Exception e) {
            Log.PrintLog(new Log("No activities for username: " + username, "ServletAttivita"));

            Gson gson = new Gson();
            ResponseObj responseObj = new ResponseObj("false",
                    "Nessuna attivita' specificata per questo utente", "");

            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.setContentType("application/json");
            resp.getWriter().write(gson.toJson(responseObj));
        }
    }

    @Override
    public void destroy() {
        this.db.Close();
    }

    static class DataClassToSend {
        NamedBool[] activities;

        public DataClassToSend(boolean attivita1, boolean attivita2, boolean attivita3) {
            this.activities = new NamedBool[3];
            this.activities[0] = new NamedBool("Activity_1", attivita1);
            this.activities[1] = new NamedBool("Activity_2", attivita2);
            this.activities[2] = new NamedBool("Activity_3", attivita3);
        }
    }

    static class NamedBool {
        String name;
        boolean bool;

        public NamedBool(String name, boolean bool) {
            this.name = name;
            this.bool = bool;
        }
    }



}
