package Controllers;

import ConfImporter.CookieConf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * This Servlet handles the creations of the Cookies in the frontend if there is the confirmation in the <code>CookieFilter</code>
 * Servlet.
 */
@WebServlet(name = "CookieServlet", value = "/CookieServlet")
public class CookieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie cookie = new Cookie(CookieConf.DefaultCookieName, CookieConf.DefaultCookieValue);
        cookie.setMaxAge(CookieConf.CookieDuration);
        cookie.setPath(CookieConf.DefaultCookiePath);
        response.addCookie(cookie);
    }
}
