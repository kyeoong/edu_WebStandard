package och02Git;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Add3
 */
@WebServlet("/Add3")  // 어노테이션이 있어야 Add3을 찾아간다 반드시 있어야 한다
public class Add3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");             // 안써도 괜찮지만 써주는 것이 관례
		// TODO Auto-generated method stub
		System.out.println("doGet Start");
		int num = Integer.parseInt(request.getParameter("num"));
		String han = request.getParameter("han");
		System.out.println("num = " + num);
		System.out.println("han = " + han);
		// num의 누적분을 return 목표
		int sum = 0;
		for (int i = 1 ; i <=num ; i++) {
			sum += i;
		}
		
		// browser에 Display 하기 위한 방법
		response.setContentType("text/html;charset=utf-8");     // 한글이 깨지는 문제 해결
		
		// browser에 상세내용을 보여줌
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		// out.println("<h1>1부터 " + num + " 까지 합계</h1>");
		out.printf("<h1> han Test : %s</h1>",han);
		out.printf("<h1>1부터 %d까지 합계</h1>", num);
		out.println(sum);
		out.println("</body></html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");             // 안써도 괜찮지만 써주는 것이 관례
		// TODO Auto-generated method stub
		System.out.println("doPost Start");
		int num = Integer.parseInt(request.getParameter("num"));  // 파라미터 값 꺼내기
		String han = request.getParameter("han");
		System.out.println("num = " + num);
		System.out.println("han = " + han);
		// num의 누적분을 return 목표
		int sum = 0;
		for (int i = 1 ; i <=num ; i++) {
			sum += i;
		}
		
		// browser에 Display 하기 위한 방법
		response.setContentType("text/html;charset=utf-8");     // 한글이 깨지는 문제 해결
		
		// browser에 상세내용을 보여줌
		PrintWriter out = response.getWriter();					
		out.println("<html><body>");
		// out.println("<h1>1부터 " + num + " 까지 합계</h1>");
		out.printf("<h1> han Test : %s</h1>",han);
		out.printf("<h1>1부터 %d까지 합계</h1>", num);
		out.println(sum);
		out.println("</body></html>");
		out.close();
	}

}
