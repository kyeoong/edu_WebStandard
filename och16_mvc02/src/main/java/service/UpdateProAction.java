package service;

import java.io.IOException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateProAction implements CommandProcess {

	@Override
	public String requestePro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			// 1.pageNum  Get
		String pageNum = request.getParameter("pageNum");
		
		try {
		// 2. Board board 생성 
		Board board = new Board();
		
		// 3. board.setXXX(....)
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setSubject(request.getParameter("subject"));
		board.setWriter(request.getParameter("writer"));
		board.setEmail(request.getParameter("email"));
		board.setPasswd(request.getParameter("passwd"));
		board.setContent(request.getParameter("content"));
		
		// 4. BoardDao bd Instance
		BoardDao bd = BoardDao.getInstance();
		
		// int result = bd.update(board);
		int result = bd.update(board);
		// 5. request 객체에 result, num , pageNum
		request.setAttribute("result", result);
		request.setAttribute("num", request.getParameter("num"));
		request.setAttribute("pageNum", pageNum);
		
		} catch (Exception e) {
			System.out.println("UpdateProAction e.getMessage"+ e.getMessage());
		} 
		
		
		return "updatePro.jsp";
	}

}
