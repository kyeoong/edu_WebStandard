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
<title>10장 중요하다 진짜 그리고 ora03 복습 대상</title>
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
	if(rs.next()){  // if : 결과가 딱 한 줄일 때 (+pk, 중복되지 않아 결과가 1줄 또는 0 이다)       while : 결과가 여러줄 일 때
		String dname = rs.getString("dname");    // rs.getString(2)
		String loc = rs.getString(3);		     // 숫자는 조회되는 컬럼 순서
		out.println("부서코드 : "	+ deptno + "<p>");
		out.println("부서명 : "	+ dname  + "<p>");
		out.println("근무지 : "   + loc    + "<p>");
		
		// 1. resqest에 저장 --> deptno , dname , loc
		request.setAttribute("deptno", deptno);
		request.setAttribute("dname", dname);
		request.setAttribute("loc", loc);
	
	} else out.println("그런 부서 없는데");
	rs.close();
	st.close();
	conn.close();	
	
		// 2. RequestDispatcher --> ora03Result.jsp Page 이동
		RequestDispatcher rd = request.getRequestDispatcher("ora03Result.jsp");
		rd.forward(request, response);
	%>
</body>
</html>