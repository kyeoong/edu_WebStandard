package och11;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mysql.cj.protocol.Resultset;

public class MemberDao {
	private Connection getConnection() throws SQLException { // 리턴 타입  Connection
		Connection conn = null;
		
		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		
		} catch (NamingException e) {
			System.out.println("e.getMessage()-> " + e.getMessage());
		}
		
		return conn;
	}
	
	// int result = md.insert(member); 이렇게 호출된다   그리고 md가 MemberDao다 왜? MemberDao md = new MemberDao(); 했으니까
	public int insert(MemberDto member) throws SQLException {   // (MemberDto  member) 에서 타입이 MemberDto인 이유 ? MemberDto member = new MemberDto(); 라고 선언했으니까!
		int result = 0;
		Connection conn = null;
		PreparedStatement ptmt = null;
		String sql = "Insert into member1 values(?, ?, ?, sysdate) ";
		// prepareStatement --> MemberDto에 insert 시키기
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, member.getId());
			ptmt.setString(2, member.getPassword());
			ptmt.setString(3, member.getName());
			result = ptmt.executeUpdate();
			if(result > 0 ) System.out.println("수정 성공");
			else            System.out.println("수정 실패");
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (ptmt != null ) ptmt.close();
			if (conn != null ) conn.close();
		}
		return result;
	}
	
			// check() -->> 정상 User 인지 확인
			// int result = md.check(id, password);
			// RESULT  1 id, password 같을때
			//         0 ID는 같고  password x
			//        -1 ID는 x
	public int check(String id, String password) throws SQLException {  //      복습 대상
		int result = 0;
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String sql = "Select password From member1 WHERE id = ?";
		
		
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, id);
			rs = ptmt.executeQuery();
			if(rs.next()) {
				String dbPassword = rs.getString(1);
				if(dbPassword.equals(password)) result = 1;
				else result = 0;
			} else result = -1;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (  rs != null ) rs.close();
			if (ptmt != null ) ptmt.close();
			if (conn != null ) conn.close();
		}
		
		
	
		
		return result;
	}
}
