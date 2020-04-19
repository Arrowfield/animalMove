package org.field.servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Servlet Filter implementation class MyFilter
 */
public class MyFilter implements Filter {

    public MyFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		if(request.getCharacterEncoding() == null) {
			
			
		}
		
		request.setCharacterEncoding("utf-8");
		
		
        /*String url = request.getRequestURI();

        if(url.indexOf(".css")>0||url.indexOf(".js")>0||url.indexOf(".png")>0) {
            chain.doFilter(request, response);
            return;
        }*/
        
        
        response.setContentType("text/css; charset=UTF-8");

		response.setCharacterEncoding("utf-8");
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		
		//this.encoding = fConfig.getInitParameter(encoding);
	}

}
