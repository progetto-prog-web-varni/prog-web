package Utils;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.LinkedList;

public class CounterData implements Serializable {
    LinkedList<LocalDateTime> hits;
    String name;

    CounterData(String name){
        this.name = name;
        this.hits = new LinkedList<>();

        this.hits.add(LocalDateTime.now());
    }

    public void increaseHit(){
        this.hits.add(LocalDateTime.now());
    }

    public LinkedList<LocalDateTime> getHits() {
        return hits;
    }

    public Boolean checkIfExist(String val) {
        return this.name.equals(val);
    }

    public int getNumberOfHits(){
        return hits.size();
    }
}
