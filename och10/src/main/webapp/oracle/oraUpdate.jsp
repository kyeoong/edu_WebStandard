<%@page import="java.sql.PreparedStatement"%>
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
	<h2>HW02 스크릿틀릿 + PreparedStatement  수정</h2>ㄴ
	<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	String sql = "Update dept SET dname = ? , loc = ? WHERE deptno = ?";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "scott","tiger");
	PreparedStatement ptmt = conn.prepareStatement(sql);
	
	
	
	%>
</body>
</html>