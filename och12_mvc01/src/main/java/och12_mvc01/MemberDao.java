package och12_mvc01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//singleton + DBCP
public class MemberDao {
	private static MemberDao instance;
	
	private MemberDao() {
		
	}
	
	public static MemberDao getInstance() {
		if(instance == null ) {
			instance = new MemberDao();
		}
		return instance;
	}
	
	// DBCP
	private Connection getConnection() throws SQLException {
	Connection conn = null;
	
	Context ctx;
	try {
		ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
	} catch (NamingException e) {
		System.out.println(e.getMessage());
	}
     return conn;
	
	
	}
	
	public int check(String id, String passwd) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String sql = "Select passwd From member2 where id = ?";
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, id);
			rs = ptmt.executeQuery();
			if(rs.next()) {
				if( rs.getString(1).equals(passwd) ) result = 1;
				else result = 0;
			} else result = -1;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null ) rs.close();
			if(ptmt != null ) ptmt.close();
			if(conn != null ) conn.close();
		}
		
		return result;
	}
	
	public int insert(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement ptmt = null;
		String sql = "Insert into member2 values(?,?,?,?,?,sysdate) ";
		
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, member.getId());
			ptmt.setString(2, member.getPasswd());
			ptmt.setString(3, member.getName());
			ptmt.setString(4, member.getAddress());
			ptmt.setString(5, member.getTel());
			result = ptmt.executeUpdate();
			if(result>0) System.out.println("입력 성공");
			else         System.out.println("입력 아직");
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(ptmt != null) ptmt.close();
			if(conn != null) conn.close();
		}
		
		
		return result;
	}
	
	public int confirm(String id) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement ptmt = null;
		String sql = "Select id From member2 where id = ?";
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, id);
			rs = ptmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else result = 0;
			
			
		} catch (SQLException e) {
		System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(ptmt != null) ptmt.close();
			if(conn != null) conn.close();
		}
		return result;
	}
	
	public List<Member> list() throws SQLException {
		List<Member> list = new ArrayList<Member>(); // list에 arraylist가 있다는 것을 몰랐어유 
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = "Select * from member2";
		
		try {
			conn = getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) { // 만약 Select문이 없다면 예외 발생 -- > 따라서 문장이 있는지 한번 체크
				do {
					Member member = new Member();
					member.setId(rs.getString(1));
					member.setPasswd(rs.getString(2));
					member.setName(rs.getString(3));
					member.setAddress(rs.getString(4));
					member.setTel(rs.getString(5));
					member.setReg_date(rs.getDate(6));
					list.add(member);
				} while(rs.next());
			}
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
				if(rs != null) rs.close();
				if(st != null) st.close();
				if(conn != null) conn.close();
		}
		
		return list;
	}
	
	public Member select(String id) throws SQLException {
		Member member = new Member();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ptmt = null;
		String sql = "Select * from member2 where id = " + id;
		
		try {
			conn = getConnection();
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
			if(rs.next()) {
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setAddress(rs.getString(4));
				member.setTel(rs.getString(5));
				member.setReg_date(rs.getDate(6));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(ptmt != null) ptmt.close();
			if(conn != null) conn.close();
		}
		
		return member;
	}
	
	
}
