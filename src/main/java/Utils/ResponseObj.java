package Utils;

public class ResponseObj {
    public final String success;
    public final String message;
    public String content = "";

    public ResponseObj(String success, String message, String content) {
        this.success = success;
        this.message = message;
        this.content = content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
