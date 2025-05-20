package och02;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Num
 */
@WebServlet("/Num")
public class Num extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Num() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html></body><h1>연산결과</h1>");
		out.println("덧셈 : "+num1+" + "+ num2 + " = " + (num1+num2)+"<p>");
		out.println("뺄셈 : "+num1+" - "+ num2 + " = " + (num1-num2)+"<p>");
		out.println("곱셈 : "+num1+" * "+ num2 + " = " + (num1*num2)+"<p>");
		out.println("나눗셈 : "+num1+" / "+ num2 + " = " + (num1/num2)+"<p>");
		out.println("</body></html>");
		out.close();
	}

	/*
	 * 연산결과 
	 * 덧셈 : 100 + 2 = 102 
	 * 뺄셈 : 100 - 2 = 98 
	 * 곱셈 : 100 * 2 = 200 
	 * 나눗셈 : 100 / 2 = 50
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
