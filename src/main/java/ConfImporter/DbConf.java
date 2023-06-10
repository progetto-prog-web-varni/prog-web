package ConfImporter;

public class DbConf {
    //public String dbURL = "jdbc:derby://derby:1527/WebDB";
    // System.getEnv(key_of_variable)
    public String dbURL = "jdbc:derby://localhost:1527/WebDB";
    public String user = "App";
    public String password = "pw";

    public boolean useRealDB = true;

    public static final String DefStartingPage = "/prog_web_war/";
}


