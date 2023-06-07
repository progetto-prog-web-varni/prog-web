package Controllers;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

// Filtro per la gestione delle sessions
@WebFilter("/AreaRiservata/*")
public class AuthMiddleware implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // non serve
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;


        // Verifica se la richiesta è per una pagina protetta (area riservata)
        if (isProtectedPage(request)) {
            HttpSession session = request.getSession(false);


            // se utente ancora in sessione vai avanti
            if (session != null && session.getAttribute("username") != null && session.getAttribute("role") != null) {

                filterChain.doFilter(request, response);
            } else {
                // se utente non più in sessione vai in login
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }
        }
    }

    @Override
    public void destroy() {
        // non serve
    }


    private boolean isProtectedPage(HttpServletRequest request) {
        //applica a tutte le private
        String requestURI = request.getRequestURI();
        return requestURI.startsWith(request.getContextPath() + "/AreaRiservata/");
    }
}
