<%@page import="java.sql.PreparedStatement"%>
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
	<h2>현장 WORK</h2>
	<!--  	스크릿틀릿 + ( PreparedStatement +sql문장)   -->
	<!-- 	Dept Table row Insert 					 -->
	<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	String sql = "Insert into dept values (?, ?, ?) ";
	
	Class.forName(driver);
	
	Connection conn = DriverManager.getConnection(url,"scott","tiger");
	PreparedStatement ptmt = conn.prepareStatement(sql);
	
	/* int result = ptmt.executeUpdate();   여기에 넣으면 안된다 파라미터 안넣*/
	ptmt.setString(1, deptno);
	ptmt.setString(2, dname);
	ptmt.setString(3, loc);
	
	int result = ptmt.executeUpdate();
	if(result > 0) out.println("입력 성공");
	else           out.println("실패 흑유흑유");
	ptmt.close();
	conn.close();
	
	%>
</body>
</html>