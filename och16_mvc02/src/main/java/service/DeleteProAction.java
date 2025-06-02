package service;

import java.io.IOException;

import dao.Board;
import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteProAction implements CommandProcess {

	@Override
	public String requestePro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("DeleteProAction start");
		// 1. num , passwd , pageNum Get
		// 2. BoardDao bd Instance
		// 3. 본인의 게시판 만 삭제 int result = bd.delete(num, passwd);
		// 4. request 객체에  num , pageNum ,result
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			String passwd = request.getParameter("passwd");
			
			BoardDao bd = BoardDao.getInstance();
			int result = bd.delete(num, passwd);
			
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println("DeleteProAction e.getMessage()=> " +e.getMessage());
		}
		
		return "deletePro.jsp";
	}

}
