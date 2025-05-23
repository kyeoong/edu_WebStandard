<%@page import="och10.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr:hover {
	background-color: red;
	}
</style>
</head>
<body>
	<h2>MVC Model 1 View</h2>
	<%
		// al 을 al 로 가져옴
		ArrayList<Emp> al = (ArrayList<Emp>)request.getAttribute("al");
		/* 
		1601	노경민	DEVELOPER	3000   -->> get(0)
		1602	홍길동1					   -->> get(1)
		3000	유상진	SQL	3500		   -->> get(2)
		 */
	%>
	<table width="100%" bgcolor="yellow" border="1">
	<tr><th>사번</th><th>이름</th><th>업무</th><th>급여</th></tr>
	
	<%
		for(int i = 0; i <al.size(); i++){
			out.println("<tr><td>" + al.get(i).getEmpno()+"</td>");
			out.println("<td>" + al.get(i).getEname()+"</td>");
			out.println("<td>" + al.get(i).getJob()+"</td>");
			out.println("<td>" + al.get(i).getSal()+"</td></tr>");
		}
	
	%>
	
	
	
	
	</table>
</body>
</html>