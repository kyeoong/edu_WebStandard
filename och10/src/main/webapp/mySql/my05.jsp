<%@page import="och10.Professor"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
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
	
	// 1. Professor --> profno,name,position,sal
	String sql = "Select profno, name, position, sal from professor";
	
	
	// 2. 모든 Professor Row  --> ArrayList<Professor>    al 저장 
	ArrayList<Professor> al = new ArrayList<Professor>();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	if(rs.next()){ /*  30 ~ 42 Line 로직 알아두고 나중에 DAO로 만든다 */
		do {
			Professor p = new Professor();
			p.setProfno(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setPosition(rs.getString(3));
			p.setSal(rs.getInt(4));
			al.add(p);
		}while(rs.next());
		request.setAttribute("al", al);
		rs.close();
		st.close();
		conn.close();
		// 3. my05Model01.jsp
/* 		RequestDispatcher rd = request.getRequestDispatcher("my05Model01.jsp"); */
		RequestDispatcher rd = request.getRequestDispatcher("my05Model02.jsp");
		rd.forward(request, response);
	}else {
		out.println("그런 부서 없엉");
		st.close();
		conn.close();
	}
		
	


%>
</body>
</html>