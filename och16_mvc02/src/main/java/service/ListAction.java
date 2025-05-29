package service;

import java.io.IOException;
import java.sql.SQLException;

import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListAction implements CommandProcess {

	@Override
	public String requestePro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("ListAction Start");
		
		// Service 에서 DAO 호출
		BoardDao boardDao = BoardDao.getInstance();
		
		int totCnt=0;
		try {
			totCnt = boardDao.getTotalCnt();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("totCnt", totCnt);
		
		
		//      View 명칭
		return "list.jsp";
	}

}
