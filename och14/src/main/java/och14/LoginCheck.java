package och14;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet Filter implementation class LoginCheck
 */
@WebFilter("/sub2/*")
public class LoginCheck extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("LoginCheck DoFilter 시작 1");
		
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response; // 부모 (response, request)는 자식에게 대입 당해도 된다
		// Session 도출 방법 12:32                  그리고 34분
		HttpSession session = httpServletRequest.getSession();
		System.out.println("LoginCheck DoFilter 시작 2");
		if(session == null || session.equals("")) {
			httpServletResponse.sendRedirect("../login.jsp"); // 36분
		}
		System.out.println("doFilter session != null");
		String id = (String)session.getAttribute("id");
		System.out.println("doFilter session id = " + id);
		
		chain.doFilter(request, response);
		System.out.println("LoginCheck Filter 끄으읏");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
