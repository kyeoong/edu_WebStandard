<%@page import="och10.Professor"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr:hover {background-color: red;}
</style>
</head>
<body>
			<!--  Model 1 View -->
			<%
			// al을 가져옴
			ArrayList<Professor> al = (ArrayList<Professor>)request.getAttribute("al");
			%>
			<table bgcolor="yellow" width="100%" border="1">
			<tr><th>사번</th><th>이름</th><th>업무</th><th>급여</th></tr>
			<% 
			// 가져온 al을 이용해 for문으로 보여줌
			for(int i = 0; i <al.size() ; i++){   // size() --> 배열 length() 같은 거다
				out.println("<tr><td>"+al.get(i).getProfno()+"</td>");
				out.println("<td>"+al.get(i).getName()+"</td>");
				out.println("<td>"+al.get(i).getPosition()+"</td>");
				out.println("<td>"+al.get(i).getSal()+"</td></tr>");
			}
			%>
					
			
			</table>
</body>
</html>