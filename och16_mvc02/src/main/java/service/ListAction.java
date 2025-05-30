package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.Board;
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
			// 38
			totCnt = boardDao.getTotalCnt();
			
			// 페이징 알아야한다 paging : 글을 나눠서 보여주는 기능 (예: 한 페이지에 10개)
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum.equals("")) {pageNum="1";}  // index.jsp에서 들어오면 ?pageNum = null 그래서 무조건 1페이지로 만들어준다
			int currentPage = Integer.parseInt(pageNum);   // 1
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1; // 1   11
			int endRow   = startRow + pageSize - 1;          // 10  20
			int startNum = totCnt - startRow + 1;            // 38  ,  37 ,  
			
			// Board 조회								1			10		
			List<Board> list = boardDao.boardList(startRow, endRow);
			//									     38  / 10
			int pageCnt = (int) Math.ceil((double)totCnt/pageSize); // 4
			System.out.println("currentPage => " + currentPage);
			System.out.println("blockSize   => " + blockSize);
			//                      1
			int startPage  = (int)(currentPage-1)/blockSize*blockSize + 1; // 1
			int startPage3 = (int)(currentPage-1) + 1;   				   // 1
			System.out.println("startPage  => " + startPage);
			System.out.println("startPage3 => " + startPage3);
			
			int endPage = startPage + blockSize - 1;         // 10
			//공갈 Page 방지      10 > 4
			if(endPage > pageCnt) endPage = pageCnt; 		 // 4
			
			request.setAttribute("boardList", list); // ***
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//      View 명칭
		return "list.jsp";
	}

}
