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

	public int insert(Board board) throws SQLException {
		int result = 0;
		int num = board.getNum();
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		// 신규글 + 댓글 PK : 현재 게시판에서 가장 큰 num 값 가져오기
		String sql1 = "Select nvl(max(num),0) From Board";
		
		// 홍해의 기적 --> 댓글 공용
		// 댓글일 경우: 같은 ref 그룹 내에서 현재 re_step보다 큰 값들 re_step + 1 (댓글 밀어내기)
		String sql2 = "Update board Set re_step = re_step+1 Where ref = ? and re_step > ?";
		
		// 신규글 + 댓글 공융 : 실제 글 저장
		String sql3 = "Insert into board values(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		
		try {
			// sql1 실행: 현재 최대 num 구하기
			conn = getConnection();
			ptmt = conn.prepareStatement(sql1);
			rs = ptmt.executeQuery();
			rs.next(); // 결과가 있다고 가정하고 바로 이동
			// key인 num 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?...)
			int number = rs.getInt(1) + 1;
			rs.close();
			ptmt.close();
			
			// sql2 -- > 댓글일 경우 실행되는 블록
			if(num != 0)  {
				System.out.println("BoardDao insert 댓글 sql2-> " +sql2);
				System.out.println("BoardDao insert 댓글 board.getRef()-> " +board.getRef());
				System.out.println("BoardDao insert 댓글 board.getRe_step()-> " +board.getRe_step());
				// 기존 댓글들 밀어내기
				ptmt = conn.prepareStatement(sql2);
				ptmt.setInt(1, board.getRef());
				ptmt.setInt(2, board.getRe_step());
				ptmt.executeUpdate();
				ptmt.close();
				// 여기까지 끼어들 댓글 존재 하면 밀기
				
				//  새 댓글이 들어갈 자리 설정  밀어서 생긴 자리에 데이터 넣기 / 댓글 관련 정보
				board.setRe_step(board.getRe_step()+1);
				board.setRe_level(board.getRe_level()+1);
			}
			// sql3
			// 신규 글일 경우: ref 값 세팅 (자기 자신을 기준으로 그룹화)
			if(num == 0 ) board.setRef(number);
			// 실제 글 DB 저장
			ptmt = conn.prepareStatement(sql3);
			ptmt.setInt(1, number);
			ptmt.setString(2, board.getWriter());
			ptmt.setString(3, board.getSubject());
			ptmt.setString(4, board.getContent());
			ptmt.setString(5, board.getEmail());
			ptmt.setInt(6, board.getReadcount());
			ptmt.setString(7, board.getPasswd());
			ptmt.setInt(8, board.getRef());
			ptmt.setInt(9, board.getRe_step());
			ptmt.setInt(10, board.getRe_level());
			ptmt.setString(11, board.getIp());
			result = ptmt.executeUpdate();
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (ptmt != null) ptmt.close();
			if (conn !=null) conn.close();
		}

		return result;
	}

	public int delete(int num, String passwd) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement ptmt = null;
		String sql = "Delete From board Where num = ? and passwd = ?";
		
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, num);
			ptmt.setString(2, passwd);
			result = ptmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (ptmt != null) ptmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public int delete3(int num, String passwd) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement ptmt = null;
		String sql1 = "Select passwd from board Where num=?";
		String sql2 = "Delete From board Where num = ?";
		ResultSet rs = null;
		// 2:05 전 설명 06/02
		// 댓글 까지 삭제 방법
		
		try {
			String dbPasswd = "";
			conn = getConnection();
			ptmt = conn.prepareStatement(sql1);
			ptmt.setInt(1, num);
			rs = ptmt.executeQuery();
			if(rs.next()) {
				dbPasswd = rs.getString(1);
				if(dbPasswd.equals(passwd)) {
					rs.close();
					ptmt.close();
					ptmt = conn.prepareStatement(sql2);
					ptmt.setInt(1, num);
					result = ptmt.executeUpdate();
				} else result = 0;
			} else result = -1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (ptmt != null) ptmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	

}