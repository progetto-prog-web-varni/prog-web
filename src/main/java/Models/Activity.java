package Models;

public class Activity {
    private int userId;
    private boolean activity1;
    private boolean activity2;
    private boolean activity3;

    //costruttore
    public Activity(int userId, boolean activity1, boolean activity2, boolean activity3) {
        this.userId = userId;
        this.activity1 = activity1;
        this.activity2 = activity2;
        this.activity3 = activity3;
    }

    //qua ci possiamo mettere altri metodi
}

/*altro modo
public class Activity {
    private int userId;
    private boolean[] activities;

    public Activity(int userId, boolean[] activities) {
        this.userId = userId;
        this.activities = activities;
    }

    //qua ci possiamo mettere altri metodi
} */




