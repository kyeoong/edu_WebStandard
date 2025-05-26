package och11;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

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
}
