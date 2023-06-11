package Controllers;

import ConfImporter.CookieConf;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/index.jsp", "/chiSiamo.jsp","/contatti.jsp", "/login.jsp", "/signup.jsp", "/singola_attivita.jsp"})
public class CookieFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        boolean cookiesSet = areCookiesSet(httpRequest);

        if (!cookiesSet) {
            String bannerHTML = "<div id=\"cookie-banner\">"
                    + "<p class=\"message\">Questo sito utilizza i cookie per offrirti una migliore esperienza di navigazione.</p>"
                    +"<div class=\"buttons\">"
                    + "<button id=\"accept-btn\">Accetta</button>"
                    + "<button id=\"reject-btn\">Rifiuta</button>"
                    + "</div>"
                    + "</div>";

            httpResponse.getWriter().write(bannerHTML);
        }

        chain.doFilter(request, response);
    }

    private boolean areCookiesSet(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        if (cookies != null) // Il cookie specificato è presente
            for (Cookie cookie : cookies)
                if (cookie.getName().equals(CookieConf.DefaultCookieName)) return true;

        return false;
    }


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}
