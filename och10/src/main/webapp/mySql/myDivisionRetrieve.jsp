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
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"root","mysql");
	
	// 1. dno 받아 division 조회 SQL 작성
	String dno = request.getParameter("dno");
	String sql = "Select * from division where dno = " + dno;
	
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	
	// 2.request 저장 -> dno , dname , phone , position
	if(rs.next()) {
		
		String dname = rs.getString(2);
		String phone = rs.getString(3);
		
		
		request.setAttribute("dno", dno);
		request.setAttribute("dname", dname);
		request.setAttribute("phone", phone);
		request.setAttribute("position", rs.getString(4));
		rs.close();
		st.close();
		conn.close();
	}
	
	// 3. Page이동 -> myDivisionUpdateIn.jsp
	RequestDispatcher rd = request.getRequestDispatcher("myDivisionUpdateIn.jsp");
	rd.forward(request, response);
	
	
	
%>
</body>
</html>