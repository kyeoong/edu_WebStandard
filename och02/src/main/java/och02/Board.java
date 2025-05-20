package och02;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;

/**
 * Servlet implementation class Board
 */
@WebServlet("/Board")
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		response.setContentType("text/html;charset=utf-8");   /* 보여줄려면 해야지     */
		
		
		Date date = new Date();
		
		
		PrintWriter out = response.getWriter();    /* request 아니네*/
		out.println("<html><body>");
		out.println("<h1>게시판</h1>");
		out.printf("<p>제목 : " + title +" <br>");
		out.printf("<p>작성자 : " + writer +" <br>");
		out.printf("<p>작성일 : " +  date  + "<br>");    // new Date() 라고 해도 된다
		out.printf("<pre>내용 <br>" + content +" </pre>");   // <pre> 태그는 들여쓰기, 공백, 줄바꿈 등이 HTML 그대로 브라우저에 출력   ==> 코드 블록 , 형식 유지 시 사용
		out.println("</body></html>");
		
	}
	
	
	/*
	 * 게시판 
	 * 제목 : 투표 
	 * 작성자 : 국민 
	 * 작성일 : Mon May 19 16:37:56 KST 2025 
	 * 내용 
	 * 잘 합시다
	 */

}
