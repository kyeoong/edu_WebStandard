<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
		
		Class.forName(driver);
		
		Connection conn = DriverManager.getConnection(url, "scott", "tiger");
		
		if(conn != null) out.println("연결 성공 ㅋㅋ");
		else             out.println("연결 실패 ><");
		conn.close();
	
	
	%>
	
	콘솔에서 보다가 이제 브라우저에서 보게된다
</body>
</html>