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
<!-- 
		 1. 	request에 저장 
		 2.   	Page 이동 --> my03Result.jsp
 -->	
 <%
		String driver = "com.mysql.cj.jdbc.Driver";
	 	String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";
	 	Class.forName(driver);
	 	Connection conn = DriverManager.getConnection(url,"root","mysql");
		
	 	String dno = request.getParameter("dno");
	 	String sql = "Select * from division where dno = " + dno;
	 	
	 	Statement st = conn.createStatement();
	 	ResultSet rs = st.executeQuery(sql);
	 	
	 	if(rs.next()) {
	 		request.setAttribute("dno", rs.getInt(1));
	 		request.setAttribute("dname", rs.getString(2));
	 		request.setAttribute("phone", rs.getString(3));
	 		request.setAttribute("position", rs.getString("position"));
	 		
	 		RequestDispatcher rd = request.getRequestDispatcher("my03Result.jsp");
	 		rd.forward(request, response);
	 		
	 		rs.close();
	 		st.close();
	 		conn.close();
	 	} else out.println("그런 부서 없는데");
	 	rs.close();
 		st.close();
 		conn.close();
	%>
</body>
</html>