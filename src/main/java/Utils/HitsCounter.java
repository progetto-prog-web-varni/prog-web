package Utils;

import java.io.Serializable;
import java.util.LinkedList;

public class HitsCounter implements Serializable {

    static LinkedList<CounterData> data = new LinkedList<>();
    HitsCounter(){
        data = new LinkedList<>();
    }
    static public void countsHits(Object page){

        /*
        Integer hitsCount = (Integer)context.getAttribute("hitCounter");
        if(hitsCount == null || hitsCount == 0) {
            hitsCount = 1;
        } else {
            hitsCount++;
        }
        context.setAttribute("hitCounter", hitsCount); */

        String pageName = page.toString().split("@", 2)[0];

        if(data.isEmpty()) {
            data.add(new CounterData(pageName));
            return;
        }

        boolean present = false;
        int index = -1;
        for(int i=0; i<data.size(); ++i) {
            if(data.get(i).checkIfExist(pageName)) {
                present = true;
                index = i;
            }
        }

       // synchronized () {
            if (present) {
                data.get(index).increaseHit();
            } else {
                data.add(new CounterData(pageName));
            }
        //}
    }
    
    static public String returnAllCounter() {
        StringBuffer s = new StringBuffer();

        if(data.isEmpty()) {
            s.append("<h1>No Data</h1>");
        } else {
            for (CounterData d: data) {
                s.append("{ 'hits: '")
                        .append(d.getNumberOfHits())
                        .append("', \n'pageName': '")
                        .append(d.name)
                        .append("'}");
            }
        }

        return s.toString();
    }
}
