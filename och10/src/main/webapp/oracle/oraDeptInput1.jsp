
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
	<!--  	스크릿틀릿 + Statement +sql문장( String.format) 	-->
	<!-- 	Dept Table row Insert 						-->
	<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	String sql = String.format("Insert into Dept values (%s, '%s', '%s')", deptno, dname, loc);
	System.out.println("sql : " + sql);		
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"scott","tiger");
	Statement st = conn.createStatement();
	int result = st.executeUpdate(sql);
	if(result > 0) out.println("입력 성공");
	else           out.println("실패 흑유흑유");
	st.close();
	conn.close();
	
	%>
</body>
</html>