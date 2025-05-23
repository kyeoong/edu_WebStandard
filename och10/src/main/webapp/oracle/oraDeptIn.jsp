<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>부서 정보 수정</h2>
	<form action="oraUpdate.jsp">
		부서코드 : ${deptno }<p>												<!-- 사용자에게 보여주기 위함	               -->
		<input type="hidden" 		name="deptno" 	value="${deptno }">		<!-- hidden 인 이유 :  PK를 건드리지 않기 위함 -->
		부서명 : <input type="text" 	name="dname" 	value="${dname }"><p>
		근무지 : <input type="text" 	name="loc" 		value="${loc }"><p>
		<input type="submit" value="확인">	
	</form>
</body>
</html>