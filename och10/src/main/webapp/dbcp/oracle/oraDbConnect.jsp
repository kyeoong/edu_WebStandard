<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>DBCP 연결</h2>
<%
	/* 환경과 ? 를  */
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	/* java:comp/env 예약어 env는 환경 그리고 lookup은 context.xml 찾으러가  */
	Connection conn = ds.getConnection();
	if(conn != null) out.println("연결 성공");
	else             out.println("헐 ~ ㅠㅠ");
	conn.close();
	
	
%>
</body>
</html>