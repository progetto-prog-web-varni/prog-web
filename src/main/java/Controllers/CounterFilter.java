package Controllers;

import Utils.Database;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebFilter("/*")
public class CounterFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        Database db = new Database() ;

        try {
            db.createOrUpdateCounter(null, ((HttpServletRequest) request).getRequestURI());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error while counting");
        }

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // this.db = new Database();
    }

    @Override
    public void destroy() {
        // non mi serve
    }
}
