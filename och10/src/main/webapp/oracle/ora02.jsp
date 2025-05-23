<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	String deptno = request.getParameter("deptno");
	String sql = "select * from dept where deptno = " + deptno;
	System.out.println("sql=>"+sql);
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"scott","tiger");
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	if(rs.next()){
		String dname = rs.getString("dname");    // rs.getString(2)
		String loc = rs.getString(3);		     // 숫자는 조회되는 컬럼 순서
		out.println("부서코드 : "	+ deptno + "<p>");
		out.println("부서명 : "	+ dname  + "<p>");
		out.println("근무지 : "   + loc    + "<p>");
	} else out.println("그런 부서 없는데");
	rs.close();
	st.close();
	conn.close();
	%>
</body>
</html>