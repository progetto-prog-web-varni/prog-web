package Models;

public class Counter {
    public String pageName;
    // public LinkedList<LocalDateTime> hits;
    public int hits;

    public Counter() {
    }

    public Counter(String pageName) {
        this.pageName = pageName;
        this.hits = 1;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public void setHits(int hits) {
        this.hits = hits;
    }

    public String getPageName() {
        return pageName;
    }

    public int getHits() {
        return hits;
    }
}
