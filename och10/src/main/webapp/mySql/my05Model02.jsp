<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h2>사원 명단 MOdel 2 View + JSTL</h2>
		<table width="100%" bgcolor="yellow" border="1">
		<tr bgcolor="pink">
			<th>사번</th><th>이름</th><th>업무</th><th>급여</th></tr>
		<c:forEach var="professor" items="${al }">
			<tr><td>${professor.profno }</td><td>${professor.name }</td>
			<td>${professor.position }</td><td>${professor.sal }</td></tr>		
		</c:forEach>
		여기는 뷰 코드만 쓴다
		</table>
		
</body>
</html>