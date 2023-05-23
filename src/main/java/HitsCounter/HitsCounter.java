package HitsCounter;

import jakarta.servlet.ServletContext;

public class HitsCounter {
    static public void CountHits(ServletContext context, Object page){
        Integer hitsCount = (Integer)context.getAttribute("hitCounter");
        String pageName = (String) context.getServletContextName();
        // with that we get the page
        System.out.println(page.toString().split("@", 2)[0]);
        context.setAttribute("hitCounter", hitsCount);
    }
}
