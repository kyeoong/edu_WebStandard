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
	
	String dno = request.getParameter("dno");
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"root","mysql");
	
	String sql = "Select * from division where dno = "+ dno;
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	
	if(rs.next()){
		String dno1 = rs.getString(1);
		String dname = rs.getString(2);
		String phone = rs.getString("phone");
		String position = rs.getString(4);
		
		out.println("부서코드 : " + dno1 + "<p>");
		out.println("부서명 : " + dname + "<p>");
		out.println("전화번호 : " + phone + "<p>");
		out.println("직급 : " + position + "<p>");
	} else out.println("그런 부서 없는데");
	rs.close();
	st.close();
	conn.close();
%>
</body>
</html>