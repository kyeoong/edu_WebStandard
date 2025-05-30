package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private static BoardDao instance;
	
	private BoardDao() {
		
	};
	
	public static BoardDao getInstance() {
		if(instance == null) instance = new BoardDao();
			return instance;
	}
	
	
	private Connection getConnection() {
		Connection conn = null;

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		int tot = 0;
		String sql = "Select count(*) From board";
		
		try {
			conn = getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				tot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(st != null) st.close();
			if(conn != null) conn.close();
		}
		return tot;
	}

	// List 복습대상 --> list 할 줄 알면 다른거 다 할 수 있다
	public List<Board> boardList(int startRow, int endRow) throws SQLException {
		 List<Board> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		// String sql = "select * from board order by num desc";
		// mysql --> "Select * from order by num desc limit startPage-1,10";
		String sql = "Select * From (Select rownum rn , a.* From (Select * From board order by ref desc, re_step) a ) Where rn BETWEEN ? and ?";
		
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, startRow);
			ptmt.setInt(2, endRow);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt(2));
				board.setWriter(rs.getString(3));
				board.setSubject(rs.getString(4));
				board.setContent(rs.getString(5));
				board.setEmail(rs.getString(6));
				board.setReadcount(rs.getInt(7));
				board.setPasswd(rs.getString(8));
				board.setRef(rs.getInt(9));
				board.setRe_step(rs.getInt(10));
				board.setRe_level(rs.getInt(11));
				board.setIp(rs.getString(12));
				board.setReg_date(rs.getDate(13));
				list.add(board);
			}
			
		} catch (Exception e){
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(ptmt != null) ptmt.close();
			if(conn != null) conn.close();
		}
		return list;
	}

	public Board select(int num) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String sql = "Select * from board where num = ?";
		Board board = new Board();
		
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, num);
			rs = ptmt.executeQuery();
			
			if(rs.next()) {
				board.setNum(rs.getInt("num"));
				board.setSubject(rs.getString("subject"));
				board.setWriter(rs.getString("writer"));
				board.setReg_date(rs.getDate("reg_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setIp(rs.getString("ip"));
				board.setEmail(rs.getString("email"));
				board.setContent(rs.getString("content"));
				board.setRef(rs.getInt("ref"));
				board.setRe_step(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));
			}
		} catch (Exception e){
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(ptmt != null) ptmt.close();
			if(conn != null) conn.close();
		}
		
		return board;
	}

	public void readCount(int num) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
	   // String sql = "UPDATE board SET readcount = readcount + 1 WHERE num = ?";
		String sql = "Update board SET readcount = ? Where num = ?";
		int readCnt = ((this.select(num)).getReadcount()) + 1;  // this는 현재 클래스 객체를 가리켜
		
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, readCnt);
			ptmt.setInt(2, num);
			int result  = ptmt.executeUpdate();
			if(result > 0) System.out.println("카운드 + 1");
		} catch (Exception e){
			System.out.println(e.getMessage());
		} finally {
			if(ptmt != null) ptmt.close();
			if(conn != null) conn.close();
		}
		
	}

	public int update(Board board) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
		String sql = "Update board SET subject = ? , writer = ? , email = ? , passwd = ? , content = ? WHERE num = ?";
		System.out.println(sql);
		int result = 0;
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, board.getSubject());
			ptmt.setString(2, board.getWriter());
			ptmt.setString(3, board.getEmail());
			ptmt.setString(4, board.getPasswd());
			ptmt.setString(5, board.getContent());
			ptmt.setInt(6, board.getNum());
			result = ptmt.executeUpdate();
			if(result > 0) result = 1;
		} catch (Exception e){
			System.out.println(e.getMessage());
		} finally {
			if(ptmt != null) ptmt.close();
			if(conn != null) conn.close();
		}
	
		return result;
	}

	public int insert(Board board) {
		int result = 0;
		Connection conn = null;
		PreparedStatement ptmt = null;
		String sql = "Insert into board Select max(num)+1, ? , ? , ?, ? , ? , ? ,? ,? , ? , ? , sysdate From BOARD";
		
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
		}
		return 0;
	}

}