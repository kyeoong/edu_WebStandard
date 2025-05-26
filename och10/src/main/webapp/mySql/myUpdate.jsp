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
		<h2>스크릿틀릿+PreparedStatement HW01</h2>
<%
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"root","mysql");
	
	String dno = request.getParameter("dno");
	String dname = request.getParameter("dname");
	String phone = request.getParameter("phone");
	String position = request.getParameter("position");
	
	String sql = "UPDATE division SET dname = ? , phone = ? , position = ? WHERE dno = ? ";
	
	PreparedStatement ptmt = conn.prepareStatement(sql);  // "빈칸(? ) 부터 준비해야 뭘 채우지~" 하고 양식 준비한 거다
	ptmt.setString(1, dname);
	ptmt.setString(2, phone);
	ptmt.setString(3, position);
	ptmt.setString(4, dno);
	
	int result = ptmt.executeUpdate();
	if(result > 0 ) out.println("mysql 수정 성공 ㅋㅋ");
	else     		out.println("mysql 수정 헉 ㅠㅠ");
	
	ptmt.close();
	conn.close();
	// 1. dno,dname,phone,position Get
	// 2. Update
    //    1) 성공 -> mysql 수정 성공 ㅋㅋ
    //    2) 실패 -> mysql 수정 헉 ㅠㅠ
%>
</body>
</html>