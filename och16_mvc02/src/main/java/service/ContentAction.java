package service;

import java.io.IOException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ContentAction implements CommandProcess {

	@Override
	public String requestePro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ContentAction Service start");
		
		// <a href="content.do?num=${board.num }&pageNum=${currentPage}">
		// 			${board.subject }</a>
		try {
		// 1. num, pageNum 파라미터 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		// 2. BoardDao bd 인스턴스
		BoardDao bd = BoardDao.getInstance();
		
		// 3. num의 readCount 증가
		bd.readCount(num);
		
		// 4. Board board = bd.select(num);
		Board board = bd.select(num);
		
		// 5. request 객체에 num, pageNum, board
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "content.jsp";
	}

}
