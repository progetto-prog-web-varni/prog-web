package com.example.Cookies;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CookieServlet", value = "/CookieServlet")
public class CookieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Crea il cookie e imposta il suo valore
        Cookie cookie = new Cookie("ciaone", "");
        // Imposta la durata del cookie (in secondi)
        cookie.setMaxAge(60); // 24 ore
        // Imposta il percorso del cookie (se necessario)
        cookie.setPath("/");
        // Aggiunge il cookie alla risposta
        response.addCookie(cookie);
    }
}
