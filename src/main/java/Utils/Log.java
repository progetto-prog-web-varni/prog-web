package Utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Log {
    final String message;
    final String location;
    final String date;


    public Log(String message, String location) {
        this.message = message;
        this.location = location;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        this.date = dtf.format(now);
    }

    public static void PrintLog(Log log) {
        System.out.println("[" + log.date + " - " + log.location + "]: " + log.message);
    }
}
