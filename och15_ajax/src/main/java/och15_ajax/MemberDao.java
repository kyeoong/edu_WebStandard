package och15_ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//Singleton + DBCP   4:14 5/27
public class MemberDao {
	
	// Singleton   --> Resource 절감
	private static MemberDao instance;   // 나 자신을 쓸 수 없지만 "공유" static
	
	// Default  -->> 애가 있어야 싱글톤
	private MemberDao() {
		
	}
	
	public static MemberDao getInstance() {
		if(instance == null) instance = new MemberDao();
		
		return instance; 
		// 니꺼 있으면 니꺼 써
	}
	
	// DBCP 
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn= ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	
	// member1  Read 	  복습
	// int result = memberDao.confirm(id);
	public int confirm(String id) throws SQLException  {
		int result  = 1;  
		// member1 if  Exist    1
		//             없으면     0  
		Connection conn = null;
		String sql  = "select id from member1 where id=?"; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) result = 1;
			else result = 0;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}

}
