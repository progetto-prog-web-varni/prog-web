package Utils;

public class ResponseObj {
    public String success;
    public String message;
    public String content = "";

    public ResponseObj(String success, String message, String content) {
        this.success = success;
        this.message = message;
        this.content = content;
    }

    public ResponseObj() {
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
