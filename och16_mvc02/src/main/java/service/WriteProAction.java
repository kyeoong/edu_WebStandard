package service;

import java.io.IOException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteProAction implements CommandProcess {

	@Override
	public String requestePro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. num , pageNum, writer ,  email , subject , passwd , content   Get
		// 2. Board board 생성하고 Value Setting
		Board board = new Board();
		board.setNum(Integer.parseInt(request.getParameter("num")));
		String pageNum = request.getParameter("pageNum");
		board.setWriter(request.getParameter("writer"));
		board.setEmail(request.getParameter("email"));
		board.setSubject(request.getParameter("subject"));
		board.setPasswd(request.getParameter("passwd"));
		board.setContent(request.getParameter("content"));
		board.setIp(request.getRemoteAddr());
		
		// 3. BoardDao bd Instance
		BoardDao bd = BoardDao.getInstance();
		
        // 4. int result = bd.insert(board);
		int result = bd.insert(board);
		//   num /  ref -> Max
		//   reg_date --> 시스템 일자
		//   re_level, re_step , readcount --> 0
		//   나머지는 입력 받은것 그대로
		
        // 5. request 객체에 result, num , pageNum
		request.setAttribute("result", result);
		request.setAttribute("num", Integer.parseInt(request.getParameter("num")));
		request.setAttribute("pageNum", pageNum);
		
		return "writePro.jsp";
	}

}
