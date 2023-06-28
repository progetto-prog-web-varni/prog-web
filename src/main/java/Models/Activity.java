package Models;

/**
 * Contains the type of Activity, present in the DB, and some standardize function with some query.
 */
public class Activity {
    private int userId;
    private boolean activity1;
    private boolean activity2;
    private boolean activity3;

    public Activity() {
        this.userId = 0;
        activity1 = false;
        activity2 = false;
        activity3 = false;
    }

    // Costruttore
    public Activity(int userId, boolean activity1, boolean activity2, boolean activity3) {
        this.userId = userId;
        this.activity1 = activity1;
        this.activity2 = activity2;
        this.activity3 = activity3;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    private boolean conversionStringToBool(String str) throws Exception {
        if(str.equals("true")) return true;
        else if(str.equals("false")) return false;
        else throw new Exception("Error in creation Activities. Parsing error. Required str (true|false) ");
    }
    public void setActivity1(String activity1) {
        try {
            this.activity1 = conversionStringToBool(activity1);
        } catch (Exception e){
            System.out.println("Error in SETACTIVITY exception: data passed are different from (true|false)");
        }
    }

    public void setActivity2(String activity2) {
        try {
            this.activity2 = conversionStringToBool(activity2);
        } catch (Exception e){
            System.out.println("Error in SETACTIVITY exception: data passed are different from (true|false)");
        }
    }

    public void setActivity3(String activity3) {
        try {
            this.activity3 = conversionStringToBool(activity3);
        } catch (Exception e){
            System.out.println("Error in SETACTIVITY exception: data passed are different from (true|false)");
        }
    }

    public int getUserId() {
        return userId;
    }

    public boolean isActivity1() {
        return activity1;
    }

    public boolean isActivity2() {
        return activity2;
    }

    public boolean isActivity3() {
        return activity3;
    }
}



