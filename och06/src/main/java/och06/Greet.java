package och06;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

/**
 * Servlet implementation class Greet
 */
@WebServlet("/Greet")
public class Greet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PrintWriter     log;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Greet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 		생성시
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("세상에 나를 선 보인 날");
		//File를 저장하기 위한 용도
		try {
			//File를 저장하기 위한 용도   --> PrintWriter
			log = new PrintWriter(new FileWriter("C:/log/log.txt",true)); // true의 용도 : 엎어치기 아니고 이어쓰기 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("init 오류");
		}
	}

	/**
	 * 		유언장
	 */
	public void destroy() {
		System.out.println("세상에 유언을 남긴 날");
		if(log != null) log.close(); // log 열려있으면 안된다
	}

	/**
	 * 		사회활동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String msg = name + "님 반가위\r\n";
		System.out.println(name+"님의 사회활동");
		
		GregorianCalendar gr = new GregorianCalendar();
		String date = String.format("%TF %TT", gr, gr);
		log.print( date + msg );
		response.setContentType("text/html;charset=utf-8");
		// PrintWriter -> 출력용
		PrintWriter out = response.getWriter();
		out.println("<html><body><h2>인사</h2>" + msg);
		out.println("</body></html>");
		out.close();
	}

	/**
	 * 		사회활동
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
